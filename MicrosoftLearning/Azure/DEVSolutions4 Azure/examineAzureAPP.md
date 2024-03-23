## Examine Azure App Service

### App Service on Linux

The languages, and their supported versions, are updated regularly. You can retrieve the current list by using the following command in the Cloud Shell.

```Bash
az webapp list-runtimes --os-type linux
```

## Examine Azure App Service Plans

In App Service, an app always runs in an App Service plan. An App Service plan defines a set of compute resources for a web app to run. One or more apps can be configured to run on the same computing resources (or in the same App Service plan).

When you create an App Service plan in a certain region (for example, West Europe), a set of compute resources is created for that plan in that region. Whatever apps you put into this App Service plan run on these compute resources as defined by your App Service plan.

| APP Services Instances                                                                            |
| ------------------------------------------------------------------------------------------------- |
| Operating System (Windows, Linux)                                                                 |
| Region (West US, East US, etc.)                                                                   |
| Number of VM instances                                                                            |
| Size of VM instances (Small, Medium, Large)                                                       |
| Pricing tier (Free, Shared, Basic, Standard, Premium, PremiumV2, PremiumV3, Isolated, IsolatedV2) |

### Pricing tier

| Categories        | Description                                                                                                                                                                                                |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Shared compute    | Free and shared: runs your Azure App Service together with other client Azure App Service. Each app in these tiers is allocated a certain amount of CPU resources from the shared pool. **No scalability** |
| Dedicated compute | The Basic, Standard, Premium, PremiumV2, and PremiumV3 tiers run apps on dedicated Azure VMs. Only apps in the same App Service plan share the same compute resources.                                     |
| Isolated          | The Isolated and IsolatedV2 tiers run dedicated Azure VMs on dedicated Azure Virtual Networks. It provides network isolation on top of compute isolation to your apps.                                     |

### How does my app run and scale?

In the Free and Shared tiers, an app receives CPU minutes on a shared VM instance and can't scale out. In other tiers, an app runs and scales as follows:

- An app runs on all the VM instances configured in the App Service plan.
- If multiple apps are in the same App Service plan, they all share the same VM instances.
- If you have multiple deployment slots for an app, all deployment slots also run on the same VM instances.
- If you enable diagnostic logs, perform backups, or run WebJobs, they also use CPU cycles and memory on these VM instances.

In this way, the App Service plan is the **scale unit** of the App Service apps. If the plan is configured to run five VM instances, then all apps in the plan run on all five instances. If the plan is configured for autoscaling, then all apps in the plan are scaled out together based on the autoscale settings.

### When isolating the App?

Isolate your app into a new App Service plan when:

- The app is resource-intensive.
- You want to scale the app independently from the other apps in the existing plan.
- The app needs resource in a different geographical region.

## Deploy to App Service

### Auto DEployment

Azure supports automated deployment directly from several sources. The following options are available:

- **Azure DevOps Services**: You can push your code to Azure DevOps Services, build your code in the cloud, run the tests, generate a release from the code, and finally, push your code to an Azure Web App.
- **GitHub**: Azure supports automated deployment directly from GitHub. When you connect your GitHub repository to Azure for automated deployment, any changes you push to your production branch on GitHub are automatically deployed for you.
- **Bitbucket**: With its similarities to GitHub, you can configure an automated deployment with Bitbucket.

### Manual Deployment

There are a few options that you can use to manually push your code to Azure:

- **Git**: App Service web apps feature a Git URL that you can add as a remote repository. Pushing to the remote repository deploys your app.
- **CLI**: _webapp up_ is a feature of the _az_ command-line interface that packages your app and deploys it. Unlike other deployment methods, _az webapp up_ can create a new App Service web app for you if you haven't already created one.
- **Zip deploy**: Use _curl_ or a similar HTTP utility to send a ZIP of your application files to App Service.
- **FTP/S**: FTP or FTPS is a traditional way of pushing your code to many hosting environments, including App Service.

**NOTE**: You can choose to deploy your application directly to the production slot of your Azure Web App, or you can use deployment slots as staging environments before deploying to production.

## Explore authentication and authorization in App Service

### Identity providers

App Service uses federated identity, in which a third-party identity provider manages the user identities and authentication flow for you. The following identity providers are available by default:

| Provider                    | Sign-in endpoint            | How-To guidance                               |
| --------------------------- | --------------------------- | --------------------------------------------- |
| Microsoft identity platform | /.auth/login/aad            | App Service Microsoft identity platform login |
| Facebook                    | /.auth/login/facebook       | App Service Facebook login                    |
| Google                      | /.auth/login/google         | App Service Google login                      |
| Twitter                     | /.auth/login/twitter        | App Service Twitter login                     |
| Any OpenID Connect provider | /.auth/login/<providerName> | App Service OpenID Connect login              |
| GitHub                      | /.auth/login/github         | App Service GitHub login                      |

Azure App Service provides built-in authentication and authorization support, which means that Azure can take responsibility for authenticating users on your website.

With Azure App Service authentication, you can integrate various authentication capabilities into your web app without implementing them yourself.

## Discover App Service networking features

### Default networking behavior

Azure App Service scale units support many customers in each deployment. The Free and Shared SKU plans host customer workloads on multitenant workers. The Basic and higher plans host customer workloads that are dedicated to only one App Service plan. If you have a Standard App Service plan, all the apps in that plan run on the same worker. If you scale out the worker, all the apps in that App Service plan are replicated on a new worker for each instance in your App Service plan.

### Outbound addresses

The worker VMs are broken down in large part by the App Service plans. The Free, Shared, Basic, Standard, and Premium plans all use the same worker VM type. The PremiumV2 plan uses another VM type. PremiumV3 uses yet another VM type. When you change the VM family, you get a different set of outbound addresses.

If you want to see all the addresses that your app might use in a scale unit, there's a property called

```Bash
possibleOutboundIpAddresses
```

that lists them.

### Find outbound IPs

To find the outbound IP addresses currently used by your app in the Azure portal, select **Properties** in your app's **left-hand navigation**.

You can find the same information by running the following **Azure CLI** command in the Cloud Shell. They're listed in the Additional Outbound IP Addresses field.

```Bash
Copy
az webapp show \
    --resource-group <group_name> \
    --name <app_name> \
    --query outboundIpAddresses \
    --output tsv
```

To find all possible outbound IP addresses for your app, regardless of pricing tiers, run the following command in the Cloud Shell.

```Bash
Copy
az webapp show \
    --resource-group <group_name> \
    --name <app_name> \
    --query possibleOutboundIpAddresses \
    --output tsv
```
