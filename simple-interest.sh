#!/bin/bash

# Simple Interest Calculator
# Author: [Your Name]
# Date: $(date +%Y-%m-%d)
# Version: 1.0
#
# Calculates simple interest using formula:
# Interest = (Principal * Rate * Time) / 100

set -e  # Exit on error

# Color codes for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

validate_number() {
    local input=$1
    local field_name=$2
    
    # Check if input is a positive number (integer or float)
    if ! [[ "$input" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo -e "${RED}✗ Error: '$field_name' must be a number${NC}"
        return 1
    fi
    
    # Check if greater than zero
    if (( $(echo "$input <= 0" | bc -l 2>/dev/null) )); then
        echo -e "${RED}✗ Error: '$field_name' must be greater than zero${NC}"
        return 1
    fi
    
    return 0
}
