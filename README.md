# Xenon
# xenonstack

Section A
1. I want a manual page of command so that I can see the full documentation of the command.
For example if you execute the command
man ls
as output we get the doc and usage guidelines. Similarly if I execute man internsctl I want
to see the manual of my command.

Process - I had created a internsctl.sh file where i have placed the codes by vim editor.

![1 Screenshot from 2024-01-10 13-37-32](https://github.com/AyushRaj07/xenonstack/assets/74702706/c8de1f21-9adc-4ea5-bdf3-eb318a2952fb)

![2 Screenshot from 2024-01-10 13-37-45](https://github.com/AyushRaj07/xenonstack/assets/74702706/353d57cb-b1b3-446f-ba84-bf11e74f30a2)

![3 Screenshot from 2024-01-10 13-38-34](https://github.com/AyushRaj07/xenonstack/assets/74702706/ce39aefb-e591-46a0-bf0c-9d8bf41ed1a4)

2. Each linux command has an option --help which helps the end user to understand the use
cases via examples. Similarly if I execute internsctl --help it should provide me the
necessary help

![4 Screenshot from 2024-01-10 13-56-18](https://github.com/AyushRaj07/xenonstack/assets/74702706/57fb6f74-a69b-4c9f-bf0c-be32de5e1059)

Bash script file

![5 vim internsctl](https://github.com/AyushRaj07/xenonstack/assets/74702706/da6e3aea-80a9-4921-81dc-6bb15909c711)

3. I want to see version of my command by executing
internsctl --version

![6Screenshot from 2024-01-10 14-09-23](https://github.com/AyushRaj07/xenonstack/assets/74702706/e731f72c-843b-4415-9f55-62ed95e586ec)

Section B

I want to execute the following command for -

Part1 | Level Easy

I want to get cpu information of my server through the following command:
$ internsctl cpu getinfo
Expected Output -
I want similar output as we get from lscpu command

![7 Screenshot from 2024-01-10 14-32-52](https://github.com/AyushRaj07/xenonstack/assets/74702706/a074d8fa-147b-4f04-9aa9-5c5d863a8483)

I want to get memory information of my server through the following command:
$ internsctl memory getinfo

I want similar output as we get from free command

![8 Screenshot from 2024-01-10 14-33-21](https://github.com/AyushRaj07/xenonstack/assets/74702706/2b28a26b-6d01-4642-8e2b-97d5b66a42ab)

Part2 | Level Intermediate

I want to create a new user on my server through the following command:
$ internsctl user create <username>
Note - above command should create user who can login to linux system and access his home
directory

![9  Screenshot from 2024-01-10 14-53-27](https://github.com/AyushRaj07/xenonstack/assets/74702706/3135618d-cc3d-41c7-990e-e1f7a0ba0359)

I want to list all the regular users present on my server through the following command:
$ internsctl user list


![10  Screenshot from 2024-01-10 15-09-06](https://github.com/AyushRaj07/xenonstack/assets/74702706/f505a5c7-9d74-4abb-b9fc-925a336e4e3f)

If want to list all the users with sudo permissions on my server through the following command:
$ internsctl user list --sudo-only

![10  Screenshot from 2024-01-10 15-09-43](https://github.com/AyushRaj07/xenonstack/assets/74702706/1a47848b-fb96-4381-b8f5-97c6bd0ba4ae)

Part3 | Advanced Level

By executing below command I want to get some information about a file
$ internsctl file getinfo <file-name>
Expected Output [make sure to have the output in following format only]
xenonstack@xsd-034:~$ internsctl file getinfo hello.txt
File: hellot.txt
Access: -rw-r--r--
Size(B): 5448
Owner: xenonstack
Modify: 2020-10-07 20:34:44.616123431 +0530


![Screenshot from 2024-01-10 16-30-36](https://github.com/AyushRaj07/xenonstack/assets/74702706/3f75608f-4363-41be-9f59-877ebfb5c9a3)

In case I want only specific information then I must have a provision to use options
$ internsctl file getinfo [options] <file-name>
--size, -s to print size
--permissions, -p print file permissions
--owner, o print file owner
--last-modified, m

![Screenshot from 2024-01-10 16-42-39](https://github.com/AyushRaj07/xenonstack/assets/74702706/023918f9-47f3-497e-918c-7c3cf078c318)
