# Azure environment and VM's

Credentials and Authentication:
------------------------------

  - Once the service principal has been created on Azure, edit the "Provider Info" section at the top of the "ENVIRONMENTNAME.tfvars" (file name could be anything
    but should end with .tfvars) with the following fields (pertaining to the service principal):

    ```
      # Provider info
        
        subscription_id = "<subscription_id>"
        client_id = "<client_id>"
        client_secret = "<secret used while creating the application>"
        tenant_id = "<tenant_id>"
      
    ```

Usage:
------

   run terraform: ```terraform apply```

 