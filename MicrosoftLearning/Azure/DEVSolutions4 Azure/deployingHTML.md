## HTML Deployment from Downloaded Github Repo Using Azure CLI

In this exercise, you'll deploy a basic HTML+CSS site to Azure App Service by using the Azure CLI az webapp up command. You'll then update the code and redeploy it by using the same command.

The az webapp up command makes it easy to create and update web apps. When executed it performs the following actions:

- Create a default resource group if one isn't specified.
- Create a default app service plan.
- Create an app with the specified name.
- Zip deploy files from the current working directory to the web app.

**NOTE**: There mist be said that AZURE deployment needs the client information (app name, app service plan, location, sku, etc) to operate. Due to the fact every user might have several configurations in their AZURE account is vital to specify this settings before deployment.

## Steps

### Download the sample app

<ol>
  <li>Create a directory and then navigate to it.</li><br>
  <pre><code>
  mkdir htmlapp 
  cd htmlapp
  </code></pre>
  <li>
    Run the following git command to clone the sample app repository to your
    htmlapp directory.
  </li><br>
  <pre><code>git clone https://github.com/Azure-Samples/html-docs-hello-world.git</code></pre>
  <li>
    Set variables to hold the resource group and app names by running the
    following commands.
    <pre><code>resourceGroup=$(az group list --query "[].{id:name}" -o tsv)
appName=az204app$RANDOM</code></pre>
    <ol><br>
      <li>
        This command is using the Azure CLI (az) to list all the resource groups
        in your Azure subscription, and then it's extracting just the names of
        those resource groups using the --query parameter.
      </li><br>
      <pre><code>resourceGroup=$(az group list --query "[].{id:name}" -o tsv)</code></pre>
      <li>
        This command is creating a variable called appName and assigning it a
        value that consists of a prefix (az204app) and a random number generated
        by the $RANDOM environment variable in Bash.
      </li><br>
      <pre><code>appName=az204app$RANDOM</code></pre>
    </ol>
  </li>
</ol>

### Create the web app

<ol> 
<li>Change to the directory that contains the sample code and run the <em>az webapp up</em> command. 
<pre><code>
cd html-docs-hello-world
az webapp up -g $resourceGroup -n $appName --html
</code></pre>
This command may take a few minutes to run. While running, it displays information similar to the example below.
<pre><code>
{
"app_url": "https://<myAppName>.azurewebsites.net",
"location": "westeurope",
"name": "<app_name>",
"os": "Windows",
"resourcegroup": "<resource_group_name>",
"serverfarm": "appsvc_asp_Windows_westeurope",
"sku": "FREE",
"src_path": "/home/<username>/demoHTML/html-docs-hello-world ",
< JSON data removed for brevity. >
}
</code></pre>
</li>
<li>
Open a new tab in your browser and navigate to the app URL <em>:(https://<span>&#60;</span>myAppName<span>&#62;</span>.azurewebsites.net)</em> and verify the app is running. 
</li>
</ol>
