using IdentityServer4;
using IdentityServer4.Models;
using System.Collections.Generic;

namespace SecuringAngularApps.STS
{
    public static class Config
    {
        public static IEnumerable<IdentityResource> IdentityResources =>
            new List<IdentityResource>
            {
                new IdentityResources.OpenId(),
                new IdentityResources.Profile(),
            };

        public static IEnumerable<ApiResource> ApiResources =>
            new List<ApiResource>
            {
                new ApiResource("projects-api", "Projects API")
                {
                    Scopes = { "projects-api" }
                }
            };

        public static IEnumerable<ApiScope> ApiScopes =>
            new List<ApiScope>
            {
                new ApiScope("projects-api", "Projects API")
            };

        public static IEnumerable<Client> Clients =>
            new List<Client>
            {
                new Client
                {
                    ClientId = "spa-client",
                    ClientName = "Projects SPA",
                    RequireClientSecret = false,
                    AllowedGrantTypes = GrantTypes.Code,
                    RequirePkce = true,
                    AllowAccessTokensViaBrowser = true,
                    RequireConsent = false,

                    RedirectUris =           { "https://localhost:4201/signin-callback", "https://localhost:4201/assets/silent-callback.html" },
                    PostLogoutRedirectUris = { "https://localhost:4201/signout-callback" },
                    AllowedCorsOrigins =     { "https://localhost:4201" },

                    AllowedScopes =
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        "projects-api"
                    },
                    AccessTokenLifetime = 600
                }
            };
    }
}