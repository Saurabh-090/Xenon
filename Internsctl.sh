#!/bin/bash

VERSION="v0.1.0"
DATA_DIR="/path/to/interns/data"

# Function to display usage information
display_usage() {
    echo "Usage: internsctl [options]"
    echo "Options:"
    echo "  version Display command version"
    echo "  --help  Display this help message"
    echo "  cpu getinfo Display CPU information (similar to lscpu)"
    echo "  memory getinfo Display memory information (similar to free)"
    echo "  user create <username> Create a new user"
    echo "  user list List all regular users"
    echo "  user list --sudo-only List users with sudo permissions"
    echo "  file getinfo [options] <file-name> Get information about a file"
    echo "      --size, -s            Print file size"
    echo "      --permissions, -p     Print file permissions"
    echo "      --owner, -o           Print file owner"
    echo "      --last-modified, -m   Print last modified time"
    echo "Examples:"
    echo "  internsctl version    # Display command version"
    echo "  internsctl cpu getinfo   # Display CPU information"
    echo "  internsctl memory getinfo   # Display memory information"
    echo "  internsctl user create john   # Create a new user 'john'"
    echo "  internsctl user list   # List all regular users"
    echo "  internsctl user list --sudo-only   # List users with sudo permissions"
    echo "  internsctl file getinfo --size hello.txt   # Get file size"
    echo "  internsctl file getinfo --permissions hello.txt   # Get file permissions"
    echo "  internsctl file getinfo --owner hello.txt   # Get file owner"
    echo "  internsctl file getinfo --last-modified hello.txt   # Get last modified time"
}


# Function to display the version
display_version() {
    echo "internsctl $VERSION"
}

# Function to display CPU information
get_cpu_info() {
    lscpu
}

# Function to display memory information
get_memory_info() {
    free
}

# Function to create a new user
create_user() {
    if [ -z "$1" ]; then
        echo "Error: Please provide a username."
        return
    fi

    username="$1"

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists."
    else
        sudo adduser "$username"
        echo "User $username created successfully."
    fi
}

# Function to list all regular users
list_regular_users() {
    getent passwd | grep -E '/bin/(bash|sh)$' | cut -d: -f1
}

# Function to list users with sudo permissions
list_sudo_users() {
    sudo  grep -E '^[^#]*\s+\ALL=\(ALL:ALL\)' /etc/sudoers | cut -d' ' -f1
}

# Function to get basic file information
get_file_info() {
    if [ -z "$1" ]; then
        echo "Error: Please provide a file name."
        return
    fi

    filename="$1"

    if [ -e "$filename" ]; then
       echo "File: $filename"
       echo "Access: $(stat -c %A "$filename")"
       echo "Size(B): $(stat -c %s "$filename")"
       echo "Owner: $(stat -c %U "$filename")"
       echo "Modify: $(stat -c %y "$filename")"
    else
        echo "File $filename does not exist."
    fi
}

get_specific_file_info() {
    if [ -z "$1" ]; then
        echo "Error: Please provide a file name."
        return
    fi

    filename="$1"

    if [ -e "$filename" ]; then
        case "$2" in
            "--size" | "-s")
                echo "Size(B): $(stat -c %s "$filename")"
                ;;
            "--permissions" | "-p")
                echo "Access: $(stat -c %A "$filename")"
                ;;
            "--owner" | "-o")
                echo "Owner: $(stat -c %U "$filename")"
                ;;
            "--last-modified" | "-m")
                echo "Modify: $(stat -c %y "$filename")"
                ;;
            *)
                echo "Invalid option: $2"
                display_usage
                ;;
        esac
    else
        echo "File $filename does not exist."
    fi
}


# Main script
case "$1" in
    "--help")
        display_usage
        ;;
    "cpu")
        case "$2" in
            "getinfo")
                get_cpu_info
                ;;
            *)
                display_usage
                ;;
        esac
        ;;
    "memory")
        case "$2" in
            "getinfo")
                get_memory_info
                ;;
            *)
                display_usage
                ;;
        esac
        ;;
    "user")
        case "$2" in
            "create")
                create_user "$3"
                ;;
	    "list")
                if [ "$3" == "--sudo-only" ]; then
                    list_sudo_users
                else
                    list_regular_users
                fi
                ;;
            *)
                display_usage
                ;;
        esac
        ;;
    "file")
        case "$2" in
            "getinfo")
                get_file_info "$3"
                ;;
            *)
                get_specific_file_info "$3" "$4"
                ;;
        esac
        ;;
    "--version")
        display_version
        ;;
    *)
        display_usage
        ;;
esac
