<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )
    Import-DscResource -ModuleName Microsoft365DSC
    node localhost
    {
        AADHomeRealmDiscoveryPolicy "AADHomeRealmDiscoveryPolicy-displayName-value"
        {
            Definition            = @(
                MSFT_AADHomeRealDiscoveryPolicyDefinition {
                    PreferredDomain       = 'federated.example.edu'
                    AccelerateToFederatedDomain         = $True # updating here
                    AlternateIdLogin = MSFT_AADHomeRealDiscoveryPolicyDefinitionAlternateIdLogin {
                        Enabled = $True
                    }
                }
            );
            DisplayName           = "displayName-value";
            Ensure                = "Present";
            IsOrganizationDefault = $False;
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
