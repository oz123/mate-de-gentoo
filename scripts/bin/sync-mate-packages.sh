#!/bin/bash
# Script to sync MATE packages from Gentoo repository to mate-de-gentoo overlay

set -e

# Configuration
GENTOO_REPO="/var/db/repos/gentoo"
OVERLAY_REPO="/var/db/repos/mate-de-gentoo"
PACKAGE_LIST="${OVERLAY_REPO}/scripts/files/package-lists/package-list-1.28-topological"
GIT_AUTHOR="Oz Tiram"
GIT_EMAIL="oz. tiram@gmail.com"

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to get the latest version of a package
get_latest_version() {
    local repo=$1
    local category=$2
    local package=$3
    local pkg_dir="$repo/$category/$package"
    
    if [[ !  -d "$pkg_dir" ]]; then
        echo ""
        return
    fi
    
    # Find the latest ebuild (excluding 9999/live ebuilds)
    latest=$(find "$pkg_dir" -name "*.ebuild" !  -name "*9999*.ebuild" -printf "%f\n" 2>/dev/null | \
             sed 's/\. ebuild$//' | \
             sed "s/^${package}-//" | \
             sort -V | \
             tail -n1)
    
    echo "$latest"
}

# Function to get all versions of a package
get_all_versions() {
    local repo=$1
    local category=$2
    local package=$3
    local pkg_dir="$repo/$category/$package"
    
    if [[ ! -d "$pkg_dir" ]]; then
        return
    fi
    
    find "$pkg_dir" -name "*.ebuild" !  -name "*9999*.ebuild" -printf "%f\n" 2>/dev/null | \
        sed 's/\.ebuild$//' | \
        sed "s/^${package}-//" | \
        sort -V
}

# Function to copy ebuild and related files
copy_ebuild() {
    local category=$1
    local package=$2
    local version=$3
    
    local src_dir="$GENTOO_REPO/$category/$package"
    local dst_dir="$OVERLAY_REPO/$category/$package"
    
    echo -e "${GREEN}Copying $category/$package-$version${NC}"
    
    # Create destination directory
    mkdir -p "$dst_dir"
    
    # Copy ebuild
    cp "$src_dir/${package}-${version}.ebuild" "$dst_dir/"
    
    # Copy metadata. xml if exists and not already in overlay
    if [[ -f "$src_dir/metadata.xml" ]] && [[ ! -f "$dst_dir/metadata.xml" ]]; then
        cp "$src_dir/metadata.xml" "$dst_dir/"
    fi
    
    # Copy files directory if exists
    if [[ -d "$src_dir/files" ]]; then
        cp -r "$src_dir/files" "$dst_dir/" 2>/dev/null || true
    fi
    
    # Copy Manifest (we'll regenerate anyway)
    if [[ -f "$src_dir/Manifest" ]]; then
        cp "$src_dir/Manifest" "$dst_dir/"
    fi
}

# Function to generate manifest
generate_manifest() {
    local category=$1
    local package=$2
    local version=$3
    
    local pkg_dir="$OVERLAY_REPO/$category/$package"
    
    echo -e "${YELLOW}Generating manifest for $category/$package-$version${NC}"
    
    cd "$pkg_dir"
    ebuild "${package}-${version}.ebuild" manifest || {
        echo -e "${RED}Failed to generate manifest for $category/$package-$version${NC}"
        return 1
    }
}

# Function to commit changes
commit_changes() {
    local category=$1
    local package=$2
    local version=$3
    
    cd "$OVERLAY_REPO"
    
    git add "$category/$package/"
    
    git commit -m "$category/$package: add version $version from gentoo repo" \
               --author="$GIT_AUTHOR <$GIT_EMAIL>" || {
        echo -e "${YELLOW}Nothing to commit or commit failed${NC}"
        return 1
    }
}

# Function to sync a single package
sync_package() {
    local category=$1
    local package=$2
    
    echo -e "\n${GREEN}=== Checking $category/$package ===${NC}"
    
    # Get versions from both repos
    local gentoo_versions=($(get_all_versions "$GENTOO_REPO" "$category" "$package"))
    local overlay_versions=($(get_all_versions "$OVERLAY_REPO" "$category" "$package"))
    
    if [[ ${#gentoo_versions[@]} -eq 0 ]]; then
        echo -e "${YELLOW}Package not found in Gentoo repo${NC}"
        return
    fi
    
    # Check each Gentoo version
    for gver in "${gentoo_versions[@]}"; do
        local found=false
        for over in "${overlay_versions[@]}"; do
            if [[ "$gver" == "$over" ]]; then
                found=true
                break
            fi
        done
        
        if [[ "$found" == "false" ]]; then
            echo -e "${GREEN}New version found: $gver${NC}"
            
            # Copy the ebuild
            copy_ebuild "$category" "$package" "$gver"
            
            # Generate manifest
            generate_manifest "$category" "$package" "$gver"
            
            # Commit changes
            commit_changes "$category" "$package" "$gver"
        else
            echo -e "${NC}Version $gver already in overlay${NC}"
        fi
    done
}

# Main function
main() {
    echo -e "${GREEN}Starting MATE packages sync from Gentoo to overlay${NC}"
    echo -e "Gentoo repo: $GENTOO_REPO"
    echo -e "Overlay repo: $OVERLAY_REPO"
    echo -e "Package list: $PACKAGE_LIST\n"
    
    # Check if package list exists
    if [[ ! -f "$PACKAGE_LIST" ]]; then
        echo -e "${RED}Error: Package list not found at $PACKAGE_LIST${NC}"
        exit 1
    fi
    
    # Read package list and sync each package
    while IFS= read -r line; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
        
        # Parse category/package
        category="${line%%/*}"
        package="${line##*/}"
        
        sync_package "$category" "$package"
    done < "$PACKAGE_LIST"
    
    echo -e "\n${GREEN}=== Sync completed ===${NC}"
}

# Run main function
main "$@"
