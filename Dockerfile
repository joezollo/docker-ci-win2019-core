FROM mcr.microsoft.com/windows/servercore:ltsc2019
LABEL maintainer=joe@zollo.net

# Add Docker User
RUN NET USER ansible "Password!9" /ADD && \
    NET LOCALGROUP "Administrators" "ansible" /ADD

# Install OpenSSH
RUN powershell -Command \
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install openssh -y -params '"/SSHServerFeature"' ;

# Start inside PowerShell
ENTRYPOINT [ "powershell" ]