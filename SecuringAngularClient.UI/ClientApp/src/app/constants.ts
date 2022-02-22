export class Constants {
	public static clientRoot = 'https://localhost:4201/';

  // Cloud based: 1. API, 2. STS/IdentityServer4, 3. ClientID
	// public static apiRoot = 'https://securingangularappscoursev2-api-unsecure.azurewebsites.net/api/';
	// public static stsAuthority = 'https://securingangularappscoursev2-sts.azurewebsites.net/';
  // public static clientId = 'spa-client';

  // localhost based: 1. API, 2. STS/IdentityServer4, 3. ClientID
	// public static apiRoot = 'https://localhost:2112/api/';
  // public static stsAuthority = 'https://localhost:4242/';
  // public static clientId = 'spa-client';

  // Auth0 based: 1. API, 2. STS/Auth0, 3. ClientID
  public static apiRoot = 'https://localhost:2112/api/';
  public static stsAuthority = 'https://bikramsinha-tenant.us.auth0.com/';
  public static clientId = 'ObximD0DpkqIB6qMY3GGnG4ODyoy0LVG';
}
