// Copyright (c) Brock Allen & Dominick Baier. All rights reserved.
// Licensed under the Apache License, Version 2.0. See LICENSE in the project root for license information.


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


                    //RedirectUris =           { "http://localhost:4200/signin-callback", "http://localhost:4200/assets/silent-callback.html" },
                    //PostLogoutRedirectUris = { "http://localhost:4200/signout-callback" },
                    //AllowedCorsOrigins =     { "http://localhost:4200" },

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
                },
                new Client
                {
                    ClientId = "mvc",
                    ClientName = "MVC Client",
                    AllowedGrantTypes = GrantTypes.Hybrid,

                    ClientSecrets =
                    {
                        new Secret("secret".Sha256())
                    },

                    RedirectUris           = { "http://localhost:4201/signin-oidc" },
                    PostLogoutRedirectUris = { "http://localhost:4201/signout-callback-oidc" },

                    AllowedScopes =
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile
                    },
                    AllowOfflineAccess = true

                }
            };
    }
}