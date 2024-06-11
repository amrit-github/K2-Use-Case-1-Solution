This repository contains Salesforce Code and Configuration to automate below functionalities.

 1. Identify all contracts where EndDate is within the next 30 days and Status is 'Active'.
 2. Send an email notification to the customer with details of the upcoming renewal.
 3. Create a new contract record with the same details but with updated StartDate and EndDate for the new term.
 4. Update the Status of the original contract to 'Renewed'.
 5. All related files are also cloned to the New Renewed Contracts.


## How Do You Plan to Deploy Your Changes?

To Deploy code to your Salesforce Org, please create a Salesforce Developer Acocunt and follow below steps as given.

1. Install below items in your Local System from below given URL.
    1. VS Code
    2. SFDX CLI
    3. Salesforce Extensions for VS Code

2. Open VS Code and Select a New Folder, give an appropriate name to the folder.

3. Perform below command in your VS Code Terminal.
    1. git clone 'https://github.com/amrit-github/K2-Use-Case-1-Solution.git'

4. After clone is completed, press CTRL + SHIFT + P to open Command Pallette and search for SFDX: Authorize an Org.

5. Give name to your org, Select Standard Template and use Production URL (login.salesforce.com) and Login with your credentials and Allow Access to SFDX CLI to your org when prompted.

6. Now Open package.xml and right click and select Deploy to Org to bring all changes to yur Personal Developer account.

7. Now you can Edit the Custom Label to as many days you want to pick up the Upcoming Ending Contracts to further renew them. 
    1. Next_N_Days_For_Contract_End (Default - 30 Days)



# Salesforce DX Project: Next Steps
Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project
The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It
- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
