# Getting Started
## Introduction
Disclaimer: I used the official documentation from https://learn.hashicorp.com/tutorials/terraform/install-cli to install Terraform on Windows.
## Installing Chocolatey
You can install the Terraform package from the command line on a Windows machine using Powershell. You will want to open a shell as an administrator. Please reference the official documentation [here](https://chocolatey.org/install).

1. Make sure the ```Get-ExecutionPolicy``` is not restricted by setting to ```Bypass```.

     * Run ```Get-ExecutionPolicy```. If it returns Restricted, then run ```Set-ExecutionPolicy AllSigned``` or ```Set-ExecutionPolicy Bypass -Scope Process```.
     
2. Paste the following command and press enter:

     * ```Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))```
     
3. Type choco or choco-? and if you don't see any errors you successfully installed Chocolatey! 

## Installing Terraform
In the same shell or in a new shell, run the following command to install Terrafrom using the Chocolately package manager.

1. Run ``` choco install terraform ``` in the shell and allow installation
2. Verify installation by typing the command ```terraform -help```.
3. Congrats! If the installation is error free, you now have successfully installed Terraform locally on your Windows machine.
