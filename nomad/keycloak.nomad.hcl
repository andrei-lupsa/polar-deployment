job "keycloak" {
  group "keycloak" {

    network {
      mode = "bridge"
      port "http" {
        to = 8080
      }
    }

    task "keycloak" {
      driver = "docker"

      config {
        image = "quay.io/keycloak/keycloak:26.0"
        auth_soft_fail = true
        args = [
          "start-dev",
          "--import-realm"
        ]
        ports = ["http"]
        volumes = ["local:/opt/keycloak/data/import"]
      }

      env {
        KEYCLOAK_ADMIN = "user"
        KEYCLOAK_ADMIN_PASSWORD = "password"
      }

      resources{
        cpu = 500
        memory = 750
      }

      template {
        data        = <<EOF
{
    "id": "879889b2-df11-4724-91cc-e1a1c2c37fed",
    "realm": "PolarBookshop",
    "notBefore": 0,
    "defaultSignatureAlgorithm": "RS256",
    "revokeRefreshToken": false,
    "refreshTokenMaxReuse": 0,
    "accessTokenLifespan": 300,
    "accessTokenLifespanForImplicitFlow": 900,
    "ssoSessionIdleTimeout": 1800,
    "ssoSessionMaxLifespan": 36000,
    "ssoSessionIdleTimeoutRememberMe": 0,
    "ssoSessionMaxLifespanRememberMe": 0,
    "offlineSessionIdleTimeout": 2592000,
    "offlineSessionMaxLifespanEnabled": false,
    "offlineSessionMaxLifespan": 5184000,
    "clientSessionIdleTimeout": 0,
    "clientSessionMaxLifespan": 0,
    "clientOfflineSessionIdleTimeout": 0,
    "clientOfflineSessionMaxLifespan": 0,
    "accessCodeLifespan": 60,
    "accessCodeLifespanUserAction": 300,
    "accessCodeLifespanLogin": 1800,
    "actionTokenGeneratedByAdminLifespan": 43200,
    "actionTokenGeneratedByUserLifespan": 300,
    "oauth2DeviceCodeLifespan": 600,
    "oauth2DevicePollingInterval": 5,
    "enabled": true,
    "sslRequired": "external",
    "registrationAllowed": false,
    "registrationEmailAsUsername": false,
    "rememberMe": false,
    "verifyEmail": false,
    "loginWithEmailAllowed": true,
    "duplicateEmailsAllowed": false,
    "resetPasswordAllowed": false,
    "editUsernameAllowed": false,
    "bruteForceProtected": false,
    "permanentLockout": false,
    "maxFailureWaitSeconds": 900,
    "minimumQuickLoginWaitSeconds": 60,
    "waitIncrementSeconds": 60,
    "quickLoginCheckMilliSeconds": 1000,
    "maxDeltaTimeSeconds": 43200,
    "failureFactor": 30,
    "roles": {
        "realm": [
            {
                "id": "3f42160d-a6a7-4bc9-9e6f-fe0d8ffd3eed",
                "name": "customer",
                "composite": false,
                "clientRole": false,
                "containerId": "879889b2-df11-4724-91cc-e1a1c2c37fed",
                "attributes": {}
            },
            {
                "id": "859c96ba-995c-4744-bed4-a7256e4f22a0",
                "name": "offline_access",
                "description": "${role_offline-access}",
                "composite": false,
                "clientRole": false,
                "containerId": "879889b2-df11-4724-91cc-e1a1c2c37fed",
                "attributes": {}
            },
            {
                "id": "560f65cb-0c13-4688-b9e9-13ccbeda3635",
                "name": "default-roles-polarbookshop",
                "description": "${role_default-roles}",
                "composite": true,
                "composites": {
                    "realm": [
                        "offline_access",
                        "uma_authorization"
                    ],
                    "client": {
                        "account": [
                            "manage-account",
                            "view-profile"
                        ]
                    }
                },
                "clientRole": false,
                "containerId": "879889b2-df11-4724-91cc-e1a1c2c37fed",
                "attributes": {}
            },
            {
                "id": "108edde4-79ad-4320-9dbe-a6097478bafe",
                "name": "uma_authorization",
                "description": "${role_uma_authorization}",
                "composite": false,
                "clientRole": false,
                "containerId": "879889b2-df11-4724-91cc-e1a1c2c37fed",
                "attributes": {}
            },
            {
                "id": "b79e2592-d732-4a96-a115-a74e8fea6477",
                "name": "employee",
                "composite": false,
                "clientRole": false,
                "containerId": "879889b2-df11-4724-91cc-e1a1c2c37fed",
                "attributes": {}
            }
        ],
        "client": {
            "realm-management": [
                {
                    "id": "40e89ab3-1dd1-46ed-83e4-001b1bbabda9",
                    "name": "manage-events",
                    "description": "${role_manage-events}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "daca0541-99d5-47ca-88ff-be3fb3d83d19",
                    "name": "view-users",
                    "description": "${role_view-users}",
                    "composite": true,
                    "composites": {
                        "client": {
                            "realm-management": [
                                "query-groups",
                                "query-users"
                            ]
                        }
                    },
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "b5e4c055-1b2b-4a56-8489-64ac17b50735",
                    "name": "manage-clients",
                    "description": "${role_manage-clients}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "875c03c8-26f1-4d54-9114-7d76e23734bf",
                    "name": "realm-admin",
                    "description": "${role_realm-admin}",
                    "composite": true,
                    "composites": {
                        "client": {
                            "realm-management": [
                                "manage-events",
                                "view-users",
                                "manage-clients",
                                "query-groups",
                                "create-client",
                                "query-realms",
                                "query-clients",
                                "view-events",
                                "manage-users",
                                "manage-authorization",
                                "view-authorization",
                                "manage-realm",
                                "manage-identity-providers",
                                "query-users",
                                "view-clients",
                                "view-realm",
                                "impersonation",
                                "view-identity-providers"
                            ]
                        }
                    },
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "54c83776-87b0-420f-994b-e54a3cece9d1",
                    "name": "create-client",
                    "description": "${role_create-client}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "3b5178c0-41c0-4ef8-a9c6-5f750fbc8605",
                    "name": "query-groups",
                    "description": "${role_query-groups}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "4735ff33-7d6a-4414-a2bc-6f8522580ab9",
                    "name": "query-realms",
                    "description": "${role_query-realms}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "240ff0af-5a98-478a-b8a4-776ef981a36e",
                    "name": "query-clients",
                    "description": "${role_query-clients}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "b971d444-9c70-4c6b-a5b5-68127e65b1d1",
                    "name": "view-events",
                    "description": "${role_view-events}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "4e2988cc-cb32-4b3f-a06f-95bfb81523fe",
                    "name": "manage-users",
                    "description": "${role_manage-users}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "c2b010d2-88f8-47e9-bd38-9a0c01d27df0",
                    "name": "manage-authorization",
                    "description": "${role_manage-authorization}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "b6782f31-7b7f-4491-9f68-8b340d7a6b8f",
                    "name": "view-authorization",
                    "description": "${role_view-authorization}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "fee75be3-a711-40f4-86ba-651852f2cb08",
                    "name": "manage-identity-providers",
                    "description": "${role_manage-identity-providers}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "32c7516b-96c5-491b-b960-7890b06c2236",
                    "name": "manage-realm",
                    "description": "${role_manage-realm}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "1e814c10-dfdd-4484-a12d-abab2ae678d2",
                    "name": "query-users",
                    "description": "${role_query-users}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "bde1f358-960b-4f3f-ba94-a4f7831a92d8",
                    "name": "view-clients",
                    "description": "${role_view-clients}",
                    "composite": true,
                    "composites": {
                        "client": {
                            "realm-management": [
                                "query-clients"
                            ]
                        }
                    },
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "4d8afe16-df27-4bf6-8976-ded7178857c6",
                    "name": "view-realm",
                    "description": "${role_view-realm}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "d1af15d7-40d6-4000-a5ea-7b7758a644fe",
                    "name": "impersonation",
                    "description": "${role_impersonation}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                },
                {
                    "id": "ce0b10a2-eeef-4006-80e8-b8111e57fa9f",
                    "name": "view-identity-providers",
                    "description": "${role_view-identity-providers}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
                    "attributes": {}
                }
            ],
            "edge-service": [],
            "security-admin-console": [],
            "admin-cli": [],
            "account-console": [],
            "broker": [
                {
                    "id": "bc3e1db8-60ff-45d7-ba98-b09547d19d26",
                    "name": "read-token",
                    "description": "${role_read-token}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "b1bcd25d-6cf7-4adc-aaf3-7016d6155d27",
                    "attributes": {}
                }
            ],
            "account": [
                {
                    "id": "0d344b5d-6b34-4dcb-acfb-9086ff7f089d",
                    "name": "manage-account",
                    "description": "${role_manage-account}",
                    "composite": true,
                    "composites": {
                        "client": {
                            "account": [
                                "manage-account-links"
                            ]
                        }
                    },
                    "clientRole": true,
                    "containerId": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
                    "attributes": {}
                },
                {
                    "id": "e783a727-eb4c-4bc9-b94e-8d24303513ae",
                    "name": "view-profile",
                    "description": "${role_view-profile}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
                    "attributes": {}
                },
                {
                    "id": "c25e9724-307a-4e2e-9cc3-f57781c94eee",
                    "name": "view-applications",
                    "description": "${role_view-applications}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
                    "attributes": {}
                },
                {
                    "id": "bed0492b-9524-4fc8-b957-77e31ad10eea",
                    "name": "view-consent",
                    "description": "${role_view-consent}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
                    "attributes": {}
                },
                {
                    "id": "f1c3e643-89f0-4c7f-9643-6d4e3ef88904",
                    "name": "manage-account-links",
                    "description": "${role_manage-account-links}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
                    "attributes": {}
                },
                {
                    "id": "db1f7e66-39a8-4b63-9c10-b9430a0a87d0",
                    "name": "manage-consent",
                    "description": "${role_manage-consent}",
                    "composite": true,
                    "composites": {
                        "client": {
                            "account": [
                                "view-consent"
                            ]
                        }
                    },
                    "clientRole": true,
                    "containerId": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
                    "attributes": {}
                },
                {
                    "id": "f57729a8-8fb3-4e26-bb0d-af54a01b6eba",
                    "name": "delete-account",
                    "description": "${role_delete-account}",
                    "composite": false,
                    "clientRole": true,
                    "containerId": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
                    "attributes": {}
                }
            ]
        }
    },
    "groups": [],
    "defaultRole": {
        "id": "560f65cb-0c13-4688-b9e9-13ccbeda3635",
        "name": "default-roles-polarbookshop",
        "description": "${role_default-roles}",
        "composite": true,
        "clientRole": false,
        "containerId": "879889b2-df11-4724-91cc-e1a1c2c37fed"
    },
    "requiredCredentials": [
        "password"
    ],
    "otpPolicyType": "totp",
    "otpPolicyAlgorithm": "HmacSHA1",
    "otpPolicyInitialCounter": 0,
    "otpPolicyDigits": 6,
    "otpPolicyLookAheadWindow": 1,
    "otpPolicyPeriod": 30,
    "otpSupportedApplications": [
        "FreeOTP",
        "Google Authenticator"
    ],
    "webAuthnPolicyRpEntityName": "keycloak",
    "webAuthnPolicySignatureAlgorithms": [
        "ES256"
    ],
    "webAuthnPolicyRpId": "",
    "webAuthnPolicyAttestationConveyancePreference": "not specified",
    "webAuthnPolicyAuthenticatorAttachment": "not specified",
    "webAuthnPolicyRequireResidentKey": "not specified",
    "webAuthnPolicyUserVerificationRequirement": "not specified",
    "webAuthnPolicyCreateTimeout": 0,
    "webAuthnPolicyAvoidSameAuthenticatorRegister": false,
    "webAuthnPolicyAcceptableAaguids": [],
    "webAuthnPolicyPasswordlessRpEntityName": "keycloak",
    "webAuthnPolicyPasswordlessSignatureAlgorithms": [
        "ES256"
    ],
    "webAuthnPolicyPasswordlessRpId": "",
    "webAuthnPolicyPasswordlessAttestationConveyancePreference": "not specified",
    "webAuthnPolicyPasswordlessAuthenticatorAttachment": "not specified",
    "webAuthnPolicyPasswordlessRequireResidentKey": "not specified",
    "webAuthnPolicyPasswordlessUserVerificationRequirement": "not specified",
    "webAuthnPolicyPasswordlessCreateTimeout": 0,
    "webAuthnPolicyPasswordlessAvoidSameAuthenticatorRegister": false,
    "webAuthnPolicyPasswordlessAcceptableAaguids": [],
    "users": [
        {
            "id": "e28b0395-6c30-4e47-88e3-9b447bfb7267",
            "createdTimestamp": 1654540944876,
            "username": "bjorn",
            "enabled": true,
            "totp": false,
            "emailVerified": false,
            "firstName": "Bjorn",
            "lastName": "Vinterberg",
            "credentials": [
                {
                    "id": "4ff88f56-ed3a-4adc-9e46-fc37debf3e99",
                    "type": "password",
                    "createdDate": 1654540971290,
                    "secretData": "{\"value\":\"G2tnvWb5IYT/fX5sJ2BPJABYPmePx6fSTsfq2rguhHBsuH4Bx5C54m0r5ijzP+r3Q/87hsn0B6MJyiXiaRxisQ==\",\"salt\":\"JQUxC+TXJ5z1C1KiExG6TA==\",\"additionalParameters\":{}}",
                    "credentialData": "{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}"
                }
            ],
            "disableableCredentialTypes": [],
            "requiredActions": [],
            "realmRoles": [
                "customer",
                "default-roles-polarbookshop"
            ],
            "notBefore": 0,
            "groups": []
        },
        {
            "id": "8e86facd-b2fe-4936-8d53-fff3dcaee683",
            "createdTimestamp": 1654540912940,
            "username": "isabelle",
            "enabled": true,
            "totp": false,
            "emailVerified": false,
            "firstName": "Isabelle",
            "lastName": "Dahl",
            "credentials": [
                {
                    "id": "7197b022-b1a6-42c3-ae59-29523f8060aa",
                    "type": "password",
                    "createdDate": 1654540966735,
                    "secretData": "{\"value\":\"DIsOYpeZ5t6/z4isr/s9xMQAajA2lLn/UCTookY+saAyLO0fsBZ2oyI76Foxze4ONJkrFyIOWXsX95nZzR42gA==\",\"salt\":\"HrTP/yh9Ipe+9oiGa09xQw==\",\"additionalParameters\":{}}",
                    "credentialData": "{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}"
                }
            ],
            "disableableCredentialTypes": [],
            "requiredActions": [],
            "realmRoles": [
                "customer",
                "default-roles-polarbookshop",
                "employee"
            ],
            "notBefore": 0,
            "groups": []
        }
    ],
    "scopeMappings": [
        {
            "clientScope": "offline_access",
            "roles": [
                "offline_access"
            ]
        }
    ],
    "clientScopeMappings": {
        "account": [
            {
                "client": "account-console",
                "roles": [
                    "manage-account"
                ]
            }
        ]
    },
    "clients": [
        {
            "id": "9ab6d897-ae1d-4950-9c3e-e166dda8bc1e",
            "clientId": "account",
            "name": "${client_account}",
            "rootUrl": "${authBaseUrl}",
            "baseUrl": "/realms/PolarBookshop/account/",
            "surrogateAuthRequired": false,
            "enabled": true,
            "alwaysDisplayInConsole": false,
            "clientAuthenticatorType": "client-secret",
            "redirectUris": [
                "/realms/PolarBookshop/account/*"
            ],
            "webOrigins": [],
            "notBefore": 0,
            "bearerOnly": false,
            "consentRequired": false,
            "standardFlowEnabled": true,
            "implicitFlowEnabled": false,
            "directAccessGrantsEnabled": false,
            "serviceAccountsEnabled": false,
            "publicClient": true,
            "frontchannelLogout": false,
            "protocol": "openid-connect",
            "attributes": {},
            "authenticationFlowBindingOverrides": {},
            "fullScopeAllowed": false,
            "nodeReRegistrationTimeout": 0,
            "defaultClientScopes": [
                "web-origins",
                "acr",
                "roles",
                "profile",
                "email"
            ],
            "optionalClientScopes": [
                "address",
                "phone",
                "offline_access",
                "microprofile-jwt"
            ]
        },
        {
            "id": "d97f1133-2cff-4fb5-8545-5c8f1d479714",
            "clientId": "account-console",
            "name": "${client_account-console}",
            "rootUrl": "${authBaseUrl}",
            "baseUrl": "/realms/PolarBookshop/account/",
            "surrogateAuthRequired": false,
            "enabled": true,
            "alwaysDisplayInConsole": false,
            "clientAuthenticatorType": "client-secret",
            "redirectUris": [
                "/realms/PolarBookshop/account/*"
            ],
            "webOrigins": [],
            "notBefore": 0,
            "bearerOnly": false,
            "consentRequired": false,
            "standardFlowEnabled": true,
            "implicitFlowEnabled": false,
            "directAccessGrantsEnabled": false,
            "serviceAccountsEnabled": false,
            "publicClient": true,
            "frontchannelLogout": false,
            "protocol": "openid-connect",
            "attributes": {
                "pkce.code.challenge.method": "S256"
            },
            "authenticationFlowBindingOverrides": {},
            "fullScopeAllowed": false,
            "nodeReRegistrationTimeout": 0,
            "protocolMappers": [
                {
                    "id": "a6900acb-f4bc-4c3a-871c-1f5f1f752581",
                    "name": "audience resolve",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-audience-resolve-mapper",
                    "consentRequired": false,
                    "config": {}
                }
            ],
            "defaultClientScopes": [
                "web-origins",
                "acr",
                "roles",
                "profile",
                "email"
            ],
            "optionalClientScopes": [
                "address",
                "phone",
                "offline_access",
                "microprofile-jwt"
            ]
        },
        {
            "id": "d04c9370-2b46-4b99-b397-6b2ddef36c58",
            "clientId": "admin-cli",
            "name": "${client_admin-cli}",
            "surrogateAuthRequired": false,
            "enabled": true,
            "alwaysDisplayInConsole": false,
            "clientAuthenticatorType": "client-secret",
            "redirectUris": [],
            "webOrigins": [],
            "notBefore": 0,
            "bearerOnly": false,
            "consentRequired": false,
            "standardFlowEnabled": false,
            "implicitFlowEnabled": false,
            "directAccessGrantsEnabled": true,
            "serviceAccountsEnabled": false,
            "publicClient": true,
            "frontchannelLogout": false,
            "protocol": "openid-connect",
            "attributes": {},
            "authenticationFlowBindingOverrides": {},
            "fullScopeAllowed": false,
            "nodeReRegistrationTimeout": 0,
            "defaultClientScopes": [
                "web-origins",
                "acr",
                "roles",
                "profile",
                "email"
            ],
            "optionalClientScopes": [
                "address",
                "phone",
                "offline_access",
                "microprofile-jwt"
            ]
        },
        {
            "id": "b1bcd25d-6cf7-4adc-aaf3-7016d6155d27",
            "clientId": "broker",
            "name": "${client_broker}",
            "surrogateAuthRequired": false,
            "enabled": true,
            "alwaysDisplayInConsole": false,
            "clientAuthenticatorType": "client-secret",
            "redirectUris": [],
            "webOrigins": [],
            "notBefore": 0,
            "bearerOnly": true,
            "consentRequired": false,
            "standardFlowEnabled": true,
            "implicitFlowEnabled": false,
            "directAccessGrantsEnabled": false,
            "serviceAccountsEnabled": false,
            "publicClient": false,
            "frontchannelLogout": false,
            "protocol": "openid-connect",
            "attributes": {},
            "authenticationFlowBindingOverrides": {},
            "fullScopeAllowed": false,
            "nodeReRegistrationTimeout": 0,
            "defaultClientScopes": [
                "web-origins",
                "acr",
                "roles",
                "profile",
                "email"
            ],
            "optionalClientScopes": [
                "address",
                "phone",
                "offline_access",
                "microprofile-jwt"
            ]
        },
        {
            "id": "752ef05c-2457-44b3-a807-a6b832daa6ab",
            "clientId": "edge-service",
            "surrogateAuthRequired": false,
            "enabled": true,
            "alwaysDisplayInConsole": false,
            "clientAuthenticatorType": "client-secret",
            "secret": "polar-keycloak-secret",
            "redirectUris": [
                "*"
            ],
            "webOrigins": [
                "*"
            ],
            "notBefore": 0,
            "bearerOnly": false,
            "consentRequired": false,
            "standardFlowEnabled": true,
            "implicitFlowEnabled": false,
            "directAccessGrantsEnabled": false,
            "serviceAccountsEnabled": false,
            "publicClient": false,
            "frontchannelLogout": false,
            "protocol": "openid-connect",
            "attributes": {},
            "authenticationFlowBindingOverrides": {},
            "fullScopeAllowed": true,
            "nodeReRegistrationTimeout": -1,
            "defaultClientScopes": [
                "web-origins",
                "acr",
                "roles",
                "profile",
                "email"
            ],
            "optionalClientScopes": [
                "address",
                "phone",
                "offline_access",
                "microprofile-jwt"
            ]
        },
        {
            "id": "b667a765-7ee0-4a4e-a4ed-43fbd44e7b2a",
            "clientId": "realm-management",
            "name": "${client_realm-management}",
            "surrogateAuthRequired": false,
            "enabled": true,
            "alwaysDisplayInConsole": false,
            "clientAuthenticatorType": "client-secret",
            "redirectUris": [],
            "webOrigins": [],
            "notBefore": 0,
            "bearerOnly": true,
            "consentRequired": false,
            "standardFlowEnabled": true,
            "implicitFlowEnabled": false,
            "directAccessGrantsEnabled": false,
            "serviceAccountsEnabled": false,
            "publicClient": false,
            "frontchannelLogout": false,
            "protocol": "openid-connect",
            "attributes": {},
            "authenticationFlowBindingOverrides": {},
            "fullScopeAllowed": false,
            "nodeReRegistrationTimeout": 0,
            "defaultClientScopes": [
                "web-origins",
                "acr",
                "roles",
                "profile",
                "email"
            ],
            "optionalClientScopes": [
                "address",
                "phone",
                "offline_access",
                "microprofile-jwt"
            ]
        },
        {
            "id": "36fe93d5-9dca-4fe9-b5e5-601003553c8f",
            "clientId": "security-admin-console",
            "name": "${client_security-admin-console}",
            "rootUrl": "${authAdminUrl}",
            "baseUrl": "/admin/PolarBookshop/console/",
            "surrogateAuthRequired": false,
            "enabled": true,
            "alwaysDisplayInConsole": false,
            "clientAuthenticatorType": "client-secret",
            "redirectUris": [
                "/admin/PolarBookshop/console/*"
            ],
            "webOrigins": [
                "+"
            ],
            "notBefore": 0,
            "bearerOnly": false,
            "consentRequired": false,
            "standardFlowEnabled": true,
            "implicitFlowEnabled": false,
            "directAccessGrantsEnabled": false,
            "serviceAccountsEnabled": false,
            "publicClient": true,
            "frontchannelLogout": false,
            "protocol": "openid-connect",
            "attributes": {
                "pkce.code.challenge.method": "S256"
            },
            "authenticationFlowBindingOverrides": {},
            "fullScopeAllowed": false,
            "nodeReRegistrationTimeout": 0,
            "protocolMappers": [
                {
                    "id": "5a8879c0-3b8e-4cc9-a366-c011b4e588a0",
                    "name": "locale",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "locale",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "locale",
                        "jsonType.label": "String"
                    }
                }
            ],
            "defaultClientScopes": [
                "web-origins",
                "acr",
                "roles",
                "profile",
                "email"
            ],
            "optionalClientScopes": [
                "address",
                "phone",
                "offline_access",
                "microprofile-jwt"
            ]
        }
    ],
    "clientScopes": [
        {
            "id": "9077dc0f-c703-4fed-9ce8-7d121890a5c9",
            "name": "phone",
            "description": "OpenID Connect built-in scope: phone",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "true",
                "display.on.consent.screen": "true",
                "consent.screen.text": "${phoneScopeConsentText}"
            },
            "protocolMappers": [
                {
                    "id": "6050c296-201e-42d9-a76a-e595adfa3873",
                    "name": "phone number",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "phoneNumber",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "phone_number",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "4de1bad9-5f40-4c42-b36f-fb65c566d6c3",
                    "name": "phone number verified",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "phoneNumberVerified",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "phone_number_verified",
                        "jsonType.label": "boolean"
                    }
                }
            ]
        },
        {
            "id": "2f72e99e-3df4-4f5a-84e8-e1f85e0e77b7",
            "name": "email",
            "description": "OpenID Connect built-in scope: email",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "true",
                "display.on.consent.screen": "true",
                "consent.screen.text": "${emailScopeConsentText}"
            },
            "protocolMappers": [
                {
                    "id": "0e8d3c31-9ae8-45e2-a649-3aa0c2dcaa65",
                    "name": "email verified",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-property-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "emailVerified",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "email_verified",
                        "jsonType.label": "boolean"
                    }
                },
                {
                    "id": "598a659a-f381-484a-936e-dab2769e3e22",
                    "name": "email",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-property-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "email",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "email",
                        "jsonType.label": "String"
                    }
                }
            ]
        },
        {
            "id": "511bf196-6071-416b-bf87-81206b6f46d9",
            "name": "roles",
            "description": "OpenID Connect scope for add user roles to the access token",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "false",
                "display.on.consent.screen": "true",
                "consent.screen.text": "${rolesScopeConsentText}"
            },
            "protocolMappers": [
                {
                    "id": "6814d1a8-5beb-4e34-a05f-2f8ec70dbe33",
                    "name": "audience resolve",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-audience-resolve-mapper",
                    "consentRequired": false,
                    "config": {}
                },
                {
                    "id": "f6d451dc-7ae9-49b4-9c66-25938a7477f1",
                    "name": "client roles",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-client-role-mapper",
                    "consentRequired": false,
                    "config": {
                        "user.attribute": "foo",
                        "access.token.claim": "true",
                        "claim.name": "resource_access.${client_id}.roles",
                        "jsonType.label": "String",
                        "multivalued": "true"
                    }
                },
                {
                    "id": "1e865643-fcf9-4b42-b9c8-6f55f4a8f81b",
                    "name": "realm roles",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-realm-role-mapper",
                    "consentRequired": false,
                    "config": {
                        "multivalued": "true",
                        "user.attribute": "foo",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "roles",
                        "jsonType.label": "String"
                    }
                }
            ]
        },
        {
            "id": "efffd127-b4c4-4bc4-81ef-1f015dd9af21",
            "name": "web-origins",
            "description": "OpenID Connect scope for add allowed web origins to the access token",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "false",
                "display.on.consent.screen": "false",
                "consent.screen.text": ""
            },
            "protocolMappers": [
                {
                    "id": "42e0dc90-7d53-4f6c-b209-a7e5feed4d81",
                    "name": "allowed web origins",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-allowed-origins-mapper",
                    "consentRequired": false,
                    "config": {}
                }
            ]
        },
        {
            "id": "894a3505-0046-4afc-a69d-071b31eec8cf",
            "name": "address",
            "description": "OpenID Connect built-in scope: address",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "true",
                "display.on.consent.screen": "true",
                "consent.screen.text": "${addressScopeConsentText}"
            },
            "protocolMappers": [
                {
                    "id": "e7345cd3-a99e-450c-a1f2-2b29941c9d04",
                    "name": "address",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-address-mapper",
                    "consentRequired": false,
                    "config": {
                        "user.attribute.formatted": "formatted",
                        "user.attribute.country": "country",
                        "user.attribute.postal_code": "postal_code",
                        "userinfo.token.claim": "true",
                        "user.attribute.street": "street",
                        "id.token.claim": "true",
                        "user.attribute.region": "region",
                        "access.token.claim": "true",
                        "user.attribute.locality": "locality"
                    }
                }
            ]
        },
        {
            "id": "c18f040c-4528-4fb7-8c45-fece47bcfb76",
            "name": "role_list",
            "description": "SAML role list",
            "protocol": "saml",
            "attributes": {
                "consent.screen.text": "${samlRoleListScopeConsentText}",
                "display.on.consent.screen": "true"
            },
            "protocolMappers": [
                {
                    "id": "3b7dede3-0b55-4954-a65c-e012292a901e",
                    "name": "role list",
                    "protocol": "saml",
                    "protocolMapper": "saml-role-list-mapper",
                    "consentRequired": false,
                    "config": {
                        "single": "false",
                        "attribute.nameformat": "Basic",
                        "attribute.name": "Role"
                    }
                }
            ]
        },
        {
            "id": "191f2cd7-0540-400a-8ab8-340ff2f9e3bb",
            "name": "offline_access",
            "description": "OpenID Connect built-in scope: offline_access",
            "protocol": "openid-connect",
            "attributes": {
                "consent.screen.text": "${offlineAccessScopeConsentText}",
                "display.on.consent.screen": "true"
            }
        },
        {
            "id": "ee6ff0a3-9697-44c9-84a8-7aabd1c83b6e",
            "name": "microprofile-jwt",
            "description": "Microprofile - JWT built-in scope",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "true",
                "display.on.consent.screen": "false"
            },
            "protocolMappers": [
                {
                    "id": "5961ec77-02ef-4b54-b2cc-95c50a4d8d30",
                    "name": "upn",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-property-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "username",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "upn",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "e628dae2-2561-4b03-baf9-a4f7f87f98b9",
                    "name": "groups",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-realm-role-mapper",
                    "consentRequired": false,
                    "config": {
                        "multivalued": "true",
                        "userinfo.token.claim": "true",
                        "user.attribute": "foo",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "groups",
                        "jsonType.label": "String"
                    }
                }
            ]
        },
        {
            "id": "c6fba95a-edc3-4084-be2f-55ed118c14d4",
            "name": "profile",
            "description": "OpenID Connect built-in scope: profile",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "true",
                "display.on.consent.screen": "true",
                "consent.screen.text": "${profileScopeConsentText}"
            },
            "protocolMappers": [
                {
                    "id": "1bf2929c-17a6-4d3e-ab1b-85879580469e",
                    "name": "website",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "website",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "website",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "9672d6ac-d4b2-48e1-a24a-85b1fa71570f",
                    "name": "birthdate",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "birthdate",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "birthdate",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "6d36d34a-8159-40fd-84b1-7796a12d8107",
                    "name": "updated at",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "updatedAt",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "updated_at",
                        "jsonType.label": "long"
                    }
                },
                {
                    "id": "2fd0f963-744b-4c4b-b154-5b6b98d4d8f4",
                    "name": "locale",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "locale",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "locale",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "2bf44a1c-1849-457d-9612-ca307ec5a3df",
                    "name": "full name",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-full-name-mapper",
                    "consentRequired": false,
                    "config": {
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "userinfo.token.claim": "true"
                    }
                },
                {
                    "id": "8b183c75-ac60-4fb3-a8bf-1010a304d773",
                    "name": "username",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-property-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "username",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "preferred_username",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "29b4b453-b4c3-4966-9fe6-8592323212c5",
                    "name": "picture",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "picture",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "picture",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "6d21f2da-520e-4d9a-9dc6-c35eefb9a115",
                    "name": "middle name",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "middleName",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "middle_name",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "186702ca-b532-416b-9bd6-a785d2d07808",
                    "name": "zoneinfo",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "zoneinfo",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "zoneinfo",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "392cdd13-6546-4c04-bb2d-263382a1bab3",
                    "name": "nickname",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "nickname",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "nickname",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "15fb37a4-8020-45f2-bef9-7c4384bf344d",
                    "name": "profile",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "profile",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "profile",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "cf9f8233-dc55-4ad0-a164-9d646a3cfd31",
                    "name": "gender",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-attribute-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "gender",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "gender",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "12d3a97e-d3e8-476c-b5b3-e5d25d04ff9d",
                    "name": "family name",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-property-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "lastName",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "family_name",
                        "jsonType.label": "String"
                    }
                },
                {
                    "id": "f24a3174-1d86-41cc-9d00-80abacb0fabd",
                    "name": "given name",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-usermodel-property-mapper",
                    "consentRequired": false,
                    "config": {
                        "userinfo.token.claim": "true",
                        "user.attribute": "firstName",
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "claim.name": "given_name",
                        "jsonType.label": "String"
                    }
                }
            ]
        },
        {
            "id": "6df9fd7b-814c-4cef-98b6-1cfde18293c8",
            "name": "acr",
            "description": "OpenID Connect scope for add acr (authentication context class reference) to the token",
            "protocol": "openid-connect",
            "attributes": {
                "include.in.token.scope": "false",
                "display.on.consent.screen": "false"
            },
            "protocolMappers": [
                {
                    "id": "d4adb9a2-3342-43d5-830c-7c2be2ee74d0",
                    "name": "acr loa level",
                    "protocol": "openid-connect",
                    "protocolMapper": "oidc-acr-mapper",
                    "consentRequired": false,
                    "config": {
                        "id.token.claim": "true",
                        "access.token.claim": "true",
                        "userinfo.token.claim": "true"
                    }
                }
            ]
        }
    ],
    "defaultDefaultClientScopes": [
        "email",
        "roles",
        "acr",
        "role_list",
        "profile",
        "web-origins"
    ],
    "defaultOptionalClientScopes": [
        "offline_access",
        "address",
        "phone",
        "microprofile-jwt"
    ],
    "browserSecurityHeaders": {
        "contentSecurityPolicyReportOnly": "",
        "xContentTypeOptions": "nosniff",
        "xRobotsTag": "none",
        "xFrameOptions": "SAMEORIGIN",
        "contentSecurityPolicy": "frame-src 'self'; frame-ancestors 'self'; object-src 'none';",
        "xXSSProtection": "1; mode=block",
        "strictTransportSecurity": "max-age=31536000; includeSubDomains"
    },
    "smtpServer": {},
    "eventsEnabled": false,
    "eventsListeners": [
        "jboss-logging"
    ],
    "enabledEventTypes": [],
    "adminEventsEnabled": false,
    "adminEventsDetailsEnabled": false,
    "identityProviders": [],
    "identityProviderMappers": [],
    "components": {
        "org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy": [
            {
                "id": "d328c827-4224-4aa1-bd88-c77275733bf9",
                "name": "Full Scope Disabled",
                "providerId": "scope",
                "subType": "anonymous",
                "subComponents": {},
                "config": {}
            },
            {
                "id": "01de3fad-7993-4d5b-920b-e4fad0ea5da4",
                "name": "Allowed Client Scopes",
                "providerId": "allowed-client-templates",
                "subType": "anonymous",
                "subComponents": {},
                "config": {
                    "allow-default-scopes": [
                        "true"
                    ]
                }
            },
            {
                "id": "21985cbf-d0af-45eb-845f-da63212711c1",
                "name": "Allowed Protocol Mapper Types",
                "providerId": "allowed-protocol-mappers",
                "subType": "anonymous",
                "subComponents": {},
                "config": {
                    "allowed-protocol-mapper-types": [
                        "oidc-address-mapper",
                        "saml-user-attribute-mapper",
                        "oidc-usermodel-attribute-mapper",
                        "oidc-usermodel-property-mapper",
                        "saml-role-list-mapper",
                        "oidc-sha256-pairwise-sub-mapper",
                        "saml-user-property-mapper",
                        "oidc-full-name-mapper"
                    ]
                }
            },
            {
                "id": "2ad3c67d-e55a-4a19-ba58-f1eec6af19e9",
                "name": "Trusted Hosts",
                "providerId": "trusted-hosts",
                "subType": "anonymous",
                "subComponents": {},
                "config": {
                    "host-sending-registration-request-must-match": [
                        "true"
                    ],
                    "client-uris-must-match": [
                        "true"
                    ]
                }
            },
            {
                "id": "9a1a9b82-bdf0-4701-ab2f-35f23b33a25a",
                "name": "Consent Required",
                "providerId": "consent-required",
                "subType": "anonymous",
                "subComponents": {},
                "config": {}
            },
            {
                "id": "dfe4e723-26bb-404a-886d-4b3e110d55cc",
                "name": "Max Clients Limit",
                "providerId": "max-clients",
                "subType": "anonymous",
                "subComponents": {},
                "config": {
                    "max-clients": [
                        "200"
                    ]
                }
            },
            {
                "id": "2f0ed092-60da-436e-8420-9060004ad8e7",
                "name": "Allowed Client Scopes",
                "providerId": "allowed-client-templates",
                "subType": "authenticated",
                "subComponents": {},
                "config": {
                    "allow-default-scopes": [
                        "true"
                    ]
                }
            },
            {
                "id": "d5f510ca-b770-4186-8504-47beb3e79fed",
                "name": "Allowed Protocol Mapper Types",
                "providerId": "allowed-protocol-mappers",
                "subType": "authenticated",
                "subComponents": {},
                "config": {
                    "allowed-protocol-mapper-types": [
                        "oidc-usermodel-attribute-mapper",
                        "oidc-sha256-pairwise-sub-mapper",
                        "oidc-full-name-mapper",
                        "saml-user-attribute-mapper",
                        "saml-role-list-mapper",
                        "saml-user-property-mapper",
                        "oidc-usermodel-property-mapper",
                        "oidc-address-mapper"
                    ]
                }
            }
        ],
        "org.keycloak.keys.KeyProvider": [
            {
                "id": "e8a04c3d-a610-48bb-a1ee-b6f9fa1fa1da",
                "name": "aes-generated",
                "providerId": "aes-generated",
                "subComponents": {},
                "config": {
                    "kid": [
                        "503f3fdd-212e-46c1-8cd2-5c15511802b2"
                    ],
                    "secret": [
                        "WPln6ZNsqAEoJBKoaTHCHA"
                    ],
                    "priority": [
                        "100"
                    ]
                }
            },
            {
                "id": "644968b9-a844-4e93-a690-3646827692e1",
                "name": "rsa-enc-generated",
                "providerId": "rsa-enc-generated",
                "subComponents": {},
                "config": {
                    "privateKey": [
                        "MIIEpAIBAAKCAQEAp9DuNZL973aMh/I/ojkTg2bBCloMt5Lp7myQy/OllRfPQvnO2XP+oHiChyVXiXyxKmoHfVTZQG2ZyLqRj8CElOJSc1gnrDzdqCVNHVIaD8YxYhxoYldH/HitQT8gL6oaLyQe/jRgBNOyCnwRplsx8528pTJnbhaayOX5GAzxEM31ZQqVrmlF2hU/KHe15aZ4z6jg8akIBkdTz12NjOe8Q014HGpe2msTPcr3EG50EcSWvR56UPvoSNPGhRMKagdGOgM4Xq9EUprgEJBuqAClF5K5iU+0nczBLPBUMakKcYF530NuvcagyBNRJZszmo5iok3QWYpeejbEMFccBnlfoQIDAQABAoIBAGjrWWMpaZYjmi0Mqfg0kxyeS6a7MiQ7uAIW4liBFk8mubB4Gnkd6l5Nud3g3N/ak7Ge5NvZBpMfcvxqmMM1bC7haQcwYG1xCGwuFg503FJsaUeb1y9Uvm78y+V1IBxszz4V6UKpYDbkW/XuJ+LINWzIe78UylGr1E4yahA9VyJXfn2nIbinArF3ZSKRVY7ej++ekKeYu5z/QhMJYEeUER7klDUM/RBgt/ysJbTsFsRlmYcnH6y15kuFPoRuf+eGM+7Hd7KCS/AKGipQC0+9Wc8SiTCy4nwzF19HppQOsdGGI9MQ0v8wB1LsDDKL0cLt809dBbzVCTAfX2cKvh6YLxkCgYEA3i/wodRm0Pi/qoMmg6wRm9McK/3hULzNXfr20oI5V/d1x7QfXPK6BQ4miYiRja9e1EfHVWy6p8Ymh6jE08DzBnaJtE+qaKYFfUvFm/+SblciHgYHi3gL4G6aQ7zXDAPuy3OOivw17NKtMNNt57LPatdM8LAWIcGmmue4ctOUGoMCgYEAwVrHQn0TBHpoC6r2Wfj6UtHy1S2AcfzFrX11ngh+B2jVogbxnL5ba37aFQd+2+jvzOZsNOy3l78r47f/w2MgmSbhxvkzk6vyLYWWawtxSmekoCQZ+BhPiCV+me+oaKpT1PZntzVxuQ0IQ4rx5wKTezcAfe8JtgJ/Me2Zl8iuFAsCgYEAu8vnZtEhaiWl0thxWD+6zmtcV26J3/UE3BeAQaNiFpEJkxcSnzxlsFoqhnrRE+GTlHdq6zAwgBhCfs1ON/DROLg+YhIn5bXV0/aUeutEeFDbfGb6P47i8vppFzHozbYRQxNT+vN8HMRhMHC0Z29CU3rRBGrA+h001Z9fzmY4u0MCgYApOMVKc4feaIpOEoC65c3YYlI3CKBdrNooBptQudbElaEWDgzssdijrkOoQBTXpW2abXWcQutROryMq+mnKjcE77kqxm4siXf0JIrQ/3uDtVzvl0LCFcy+5d97yhBJYCbHPFEYShiYryKX48N20KHInw1Hy/JyD042wsUACxSxyQKBgQCin6rpVT9RIQHNNjimpWYPnu52mL0f/hh3tiDIL3h8K2PxktRW49sEHmge8u7JKIf9L1chK8xv+heyBZPVmkACkxKqbTPOweMKkkIbECa7rcDLh4+wLC9jOuDa8s8ThluDk1XNQXPHw7wSQD+yuls+ST+Sni5Wiveb+tr9aFeQ9w=="
                    ],
                    "keyUse": [
                        "ENC"
                    ],
                    "certificate": [
                        "MIICqTCCAZECBgGBOlJYNTANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1Qb2xhckJvb2tzaG9wMB4XDTIyMDYwNjE4Mzk0NFoXDTMyMDYwNjE4NDEyNFowGDEWMBQGA1UEAwwNUG9sYXJCb29rc2hvcDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKfQ7jWS/e92jIfyP6I5E4NmwQpaDLeS6e5skMvzpZUXz0L5ztlz/qB4goclV4l8sSpqB31U2UBtmci6kY/AhJTiUnNYJ6w83aglTR1SGg/GMWIcaGJXR/x4rUE/IC+qGi8kHv40YATTsgp8EaZbMfOdvKUyZ24Wmsjl+RgM8RDN9WUKla5pRdoVPyh3teWmeM+o4PGpCAZHU89djYznvENNeBxqXtprEz3K9xBudBHElr0eelD76EjTxoUTCmoHRjoDOF6vRFKa4BCQbqgApReSuYlPtJ3MwSzwVDGpCnGBed9Dbr3GoMgTUSWbM5qOYqJN0FmKXno2xDBXHAZ5X6ECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAnqR5VZyw2bgwU2bJl21uuzuFt00pjJB+0nT2myZdSEwV9nTLVDY+iUPlxoJFPbKh8UKZLmBOcN94kMH+8DsTF+WBVHC3hTqmqUQ6lX0WDqCN6Js1FL8NCfieGcm/d9a22mUXu46Fe6gJhVM6yiI09kYngvuL6Ga/9fMBfUdvH3kQUEof3tAvAMnXTRtCqOH8kiJ2KXVg8lxSNP6KhXaA+GsPO8TMOMC6YmEHfIfCJyMPJLwSG8xm//F1MzyQJrnqTDcLFnYWw3e31WUbWD8c64l+ESrvUfdiZNX+PzigHHnFk8uoEXNx6jGfF3fHusPIMyhfcAcOADAIMoetFRFYVg=="
                    ],
                    "priority": [
                        "100"
                    ],
                    "algorithm": [
                        "RSA-OAEP"
                    ]
                }
            },
            {
                "id": "99962456-545d-47aa-83d6-f2e437ebea40",
                "name": "rsa-generated",
                "providerId": "rsa-generated",
                "subComponents": {},
                "config": {
                    "privateKey": [
                        "MIIEowIBAAKCAQEAhO6U+eiFrG1ZpRlWw0LmwmhCi/DoiCAL3sPvAaVWR7FJ+Ynq0AyvY8hl4s2abX+ON9kOXzH1qqTz2F2NP9EkILCXLOhiYOmS0NTjYdHtZeFP3iV3v+UP82b6e3LZkVfxShDLcvmIRXaupULyMFXgefSnrndm2Luc3eiUgmUE8+cT9G6fJEYOHAwCCgDyWj3WQEXkpZgrI6BpA3iy2yT5Ru1ft7XQ8rpkXmssDv908N9GmLa7OMA8EouteKKVqSFpYJ9PgpjtjC/eE4aL+d9JFMyh8mrvoJcX7GJDvMfHTw/A4otQ8CGh1A4qBS3j2+gJCmYYqw4sJj3DYM+D8EVcMwIDAQABAoIBACL5CeS90f1NP5p6EiOJBGD9QRTEKsk1dSoEbmsGbq6p7AZkzIwz6ijcXkHPSeOo/WegCXHuGO3uO+Eeq7ywb0rSatN7x/YrPV8Hw1LHAigdoP+W5+xqfUnSO/AihS8B7g9IX9493CY6VTRRappg3Y/4V+1EqKA4q8qOGBQ+M5FfRwGB4RMYzLJkivIRkfRSwX8jSP42CxSErsXKeGg9sCUru+Wq82rpi1iHQesXasvoD9OoVxXPrZSj9aWxY1feQLDPnPAcWBhs6R4tftYEr4E7VtUaQ+/jfwmKwRvsvF9ZEZ9yynYEIkAKJPdknp5Zd6ifsrgZHmKzp5C1GP9xJ5ECgYEAu9DwrIsmuNfZP6zBI5IsyjsgbqsscKQJjCphWmlvVgrPQW6jcoTUL+Hpslui5r4FnvRctuDwXtlMmDIztHYza8MBphYfsK5b12yzwQRloTfhRAODbQbEVfMXlbeZhlElojYhYLsDHNlx3oQU0d6SLGatCAektcOc7WPv5y6nJ78CgYEAtTDfCptZ9DSmQK1q+9wo1dQUJZJiU2OmX7x5/TX2P4GqO5psW6txStDcL9CAjCFJqwgI9+2kKYjsvBs9x1Dl2JIAKeNaYbTdLcX+dYEMakbjWSzrth6J0C6oFyFVcl+PTF3Gh0iH5x49E/tMeNakQaFyKcr/aidTrzsD38ypiI0CgYEAp5Sq6onOpyeRZMtUGdUXueo/6f85y9fR3QsDipSBDxjeDNgXZts2KPM+fjJdi90JTudiwpq6XycsvLAuilrdTs3U7sjWxeMNd446ZYLy24LssK8h2WosTTR2WtRTXBGTrsT1y0WSZW9vtsfLe+dILe3/fiazxKshnn+JU5HA/CkCgYASjzv5gSo4qn/xFhJkVAvWw0+A/bqWohlzqwGv3ywnGygNzOaWiTwklrpHJ4tTT0GVhFAu3Se4nW7qYbv1Q6MXiPT9VW13nqgdPS+wZ5SW+kXlZ4WJdR1WtsC/BcoT2hf6kYx5ZQOOt/k3p8EQi6PtmRTxlPqOrBKVW20tKnCfLQKBgBOl/CGlVMUzfCW0NWVGs7Z4JCwaaEf2y2cCjqM4AOwTyTOOC6062MSRTJpkTseRbYRUn2VoU/Uu2l5AzVcYgYDSv7tRb8R71Re+tmku225w9ClbONiX50OSXeFDUl/MwfNW5v13j4Sg0o5D0y4YxfhFlRwmYdK7epxagQ1jnQxu"
                    ],
                    "keyUse": [
                        "SIG"
                    ],
                    "certificate": [
                        "MIICqTCCAZECBgGBOlJX/DANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1Qb2xhckJvb2tzaG9wMB4XDTIyMDYwNjE4Mzk0M1oXDTMyMDYwNjE4NDEyM1owGDEWMBQGA1UEAwwNUG9sYXJCb29rc2hvcDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAITulPnohaxtWaUZVsNC5sJoQovw6IggC97D7wGlVkexSfmJ6tAMr2PIZeLNmm1/jjfZDl8x9aqk89hdjT/RJCCwlyzoYmDpktDU42HR7WXhT94ld7/lD/Nm+nty2ZFX8UoQy3L5iEV2rqVC8jBV4Hn0p653Zti7nN3olIJlBPPnE/RunyRGDhwMAgoA8lo91kBF5KWYKyOgaQN4stsk+UbtX7e10PK6ZF5rLA7/dPDfRpi2uzjAPBKLrXiilakhaWCfT4KY7Ywv3hOGi/nfSRTMofJq76CXF+xiQ7zHx08PwOKLUPAhodQOKgUt49voCQpmGKsOLCY9w2DPg/BFXDMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAJe4w7im5hvVFGIfrGf5GxsyAQa1vUTyFpDacMFSmGlEH0gQ2bnFthmG1Y/gZplLiUXX+r0FPc3FsqgBf1GeggKoW5b7roq1t+JzCMqXWaZNodpbGrsKEqiAngNGmlke9pxnZvLFs18tt3DvCtojG1Lamwi3CFobnHHB5j5VwgY7ZCyV+6nJEw+vHXLKmmUgtwxvy52hIaVSi6FSVYdE0x7+0R/IGZT69CpAZVSZMXcGfXSPgh3hrb831/jHqlYC5ve4xdkRqqKqqPgYR0p2ewk0t4VKvJjWssDMFPxrmOGGNzzpopRyvsBt0W++icRFGlmJBz63ANd2kGyHqCGV16Q=="
                    ],
                    "priority": [
                        "100"
                    ]
                }
            },
            {
                "id": "8a89575a-2017-431c-83b6-99f7c66e5c17",
                "name": "hmac-generated",
                "providerId": "hmac-generated",
                "subComponents": {},
                "config": {
                    "kid": [
                        "2dac1656-f02e-4e37-b489-0839b9d8f376"
                    ],
                    "secret": [
                        "SmYeervYbw6vPMVQ-XjKNc3vlB-Zud0JZtmHI8Z05u-6cBeTS41e29wtWZsfKkdRuvJgN7Ckx_Pf-1Dwjg4NSQ"
                    ],
                    "priority": [
                        "100"
                    ],
                    "algorithm": [
                        "HS256"
                    ]
                }
            }
        ]
    },
    "internationalizationEnabled": false,
    "supportedLocales": [],
    "authenticationFlows": [
        {
            "id": "2e6ffb60-2221-40a9-88eb-c724a0b2e958",
            "alias": "Account verification options",
            "description": "Method with which to verity the existing account",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "idp-email-verification",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "ALTERNATIVE",
                    "priority": 20,
                    "autheticatorFlow": true,
                    "flowAlias": "Verify Existing Account by Re-authentication",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "e1c3ece1-d628-464f-9cce-54477b02f0f5",
            "alias": "Authentication Options",
            "description": "Authentication options.",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "basic-auth",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "basic-auth-otp",
                    "authenticatorFlow": false,
                    "requirement": "DISABLED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "auth-spnego",
                    "authenticatorFlow": false,
                    "requirement": "DISABLED",
                    "priority": 30,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "45109453-32d7-4eea-abd1-37f36c98eae0",
            "alias": "Browser - Conditional OTP",
            "description": "Flow to determine if the OTP is required for the authentication",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "conditional-user-configured",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "auth-otp-form",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "f970af38-38d0-4648-a2de-70b983126d10",
            "alias": "Direct Grant - Conditional OTP",
            "description": "Flow to determine if the OTP is required for the authentication",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "conditional-user-configured",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "direct-grant-validate-otp",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "98f6d0b5-51b6-4a72-aed8-2658df056b7c",
            "alias": "First broker login - Conditional OTP",
            "description": "Flow to determine if the OTP is required for the authentication",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "conditional-user-configured",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "auth-otp-form",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "a2b4eef4-c0dc-4141-acaf-d8a6da888c2a",
            "alias": "Handle Existing Account",
            "description": "Handle what to do if there is existing account with same email/username like authenticated identity provider",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "idp-confirm-link",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": true,
                    "flowAlias": "Account verification options",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "bb170a4f-9417-4ae5-ba6a-d91e142e24d8",
            "alias": "Reset - Conditional OTP",
            "description": "Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "conditional-user-configured",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "reset-otp",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "0708e29b-9b44-4ec7-b7c0-964e39a27286",
            "alias": "User creation or linking",
            "description": "Flow for the existing/non-existing user alternatives",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticatorConfig": "create unique user config",
                    "authenticator": "idp-create-user-if-unique",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "ALTERNATIVE",
                    "priority": 20,
                    "autheticatorFlow": true,
                    "flowAlias": "Handle Existing Account",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "e2c9bf7f-d273-4266-81cc-59f28efa1ef7",
            "alias": "Verify Existing Account by Re-authentication",
            "description": "Reauthentication of existing account",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "idp-username-password-form",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "CONDITIONAL",
                    "priority": 20,
                    "autheticatorFlow": true,
                    "flowAlias": "First broker login - Conditional OTP",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "c2e739fe-2575-4db3-96b1-9e962cc1dbad",
            "alias": "browser",
            "description": "browser based authentication",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "auth-cookie",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "auth-spnego",
                    "authenticatorFlow": false,
                    "requirement": "DISABLED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "identity-provider-redirector",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 25,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "ALTERNATIVE",
                    "priority": 30,
                    "autheticatorFlow": true,
                    "flowAlias": "forms",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "306d0b37-98c8-4ef2-817c-ba97b4c6d865",
            "alias": "clients",
            "description": "Base authentication for clients",
            "providerId": "client-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "client-secret",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "client-jwt",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "client-secret-jwt",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 30,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "client-x509",
                    "authenticatorFlow": false,
                    "requirement": "ALTERNATIVE",
                    "priority": 40,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "ab12db3e-e02b-42c3-885d-4b12e78fabaf",
            "alias": "direct grant",
            "description": "OpenID Connect Resource Owner Grant",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "direct-grant-validate-username",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "direct-grant-validate-password",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "CONDITIONAL",
                    "priority": 30,
                    "autheticatorFlow": true,
                    "flowAlias": "Direct Grant - Conditional OTP",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "bde6f774-ff3d-45b6-b8b3-9a0ecf513375",
            "alias": "docker auth",
            "description": "Used by Docker clients to authenticate against the IDP",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "docker-http-basic-authenticator",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "d43d9f98-ea10-42c0-ae02-7dac59c35a7d",
            "alias": "first broker login",
            "description": "Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticatorConfig": "review profile config",
                    "authenticator": "idp-review-profile",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": true,
                    "flowAlias": "User creation or linking",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "e7296237-b48d-4da9-8f23-4e0a66f112ad",
            "alias": "forms",
            "description": "Username, password, otp and other auth forms.",
            "providerId": "basic-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "auth-username-password-form",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "CONDITIONAL",
                    "priority": 20,
                    "autheticatorFlow": true,
                    "flowAlias": "Browser - Conditional OTP",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "e6565619-da1f-4c24-ad4c-9608b700a585",
            "alias": "http challenge",
            "description": "An authentication flow based on challenge-response HTTP Authentication Schemes",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "no-cookie-redirect",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": true,
                    "flowAlias": "Authentication Options",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "de19b2ae-9ed4-4557-8da7-cfb3170cf13a",
            "alias": "registration",
            "description": "registration flow",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "registration-page-form",
                    "authenticatorFlow": true,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": true,
                    "flowAlias": "registration form",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "5b72e8e3-eb41-4f79-8fd6-e99d3c8656d5",
            "alias": "registration form",
            "description": "registration form",
            "providerId": "form-flow",
            "topLevel": false,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "registration-user-creation",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "registration-profile-action",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 40,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "registration-password-action",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 50,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "registration-recaptcha-action",
                    "authenticatorFlow": false,
                    "requirement": "DISABLED",
                    "priority": 60,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "1097368b-09c4-4579-88cd-02f83a36c511",
            "alias": "reset credentials",
            "description": "Reset credentials for a user if they forgot their password or something",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "reset-credentials-choose-user",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "reset-credential-email",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 20,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticator": "reset-password",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 30,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                },
                {
                    "authenticatorFlow": true,
                    "requirement": "CONDITIONAL",
                    "priority": 40,
                    "autheticatorFlow": true,
                    "flowAlias": "Reset - Conditional OTP",
                    "userSetupAllowed": false
                }
            ]
        },
        {
            "id": "2986add7-a5ad-483b-9b92-8f851c17fd8f",
            "alias": "saml ecp",
            "description": "SAML ECP Profile Authentication Flow",
            "providerId": "basic-flow",
            "topLevel": true,
            "builtIn": true,
            "authenticationExecutions": [
                {
                    "authenticator": "http-basic-authenticator",
                    "authenticatorFlow": false,
                    "requirement": "REQUIRED",
                    "priority": 10,
                    "autheticatorFlow": false,
                    "userSetupAllowed": false
                }
            ]
        }
    ],
    "authenticatorConfig": [
        {
            "id": "55165e2b-4890-422f-88c9-1775861e9d9a",
            "alias": "create unique user config",
            "config": {
                "require.password.update.after.registration": "false"
            }
        },
        {
            "id": "211e30a2-e5c7-4d0c-8cbe-16f439c35f09",
            "alias": "review profile config",
            "config": {
                "update.profile.on.first.login": "missing"
            }
        }
    ],
    "requiredActions": [
        {
            "alias": "CONFIGURE_TOTP",
            "name": "Configure OTP",
            "providerId": "CONFIGURE_TOTP",
            "enabled": true,
            "defaultAction": false,
            "priority": 10,
            "config": {}
        },
        {
            "alias": "terms_and_conditions",
            "name": "Terms and Conditions",
            "providerId": "terms_and_conditions",
            "enabled": false,
            "defaultAction": false,
            "priority": 20,
            "config": {}
        },
        {
            "alias": "UPDATE_PASSWORD",
            "name": "Update Password",
            "providerId": "UPDATE_PASSWORD",
            "enabled": true,
            "defaultAction": false,
            "priority": 30,
            "config": {}
        },
        {
            "alias": "UPDATE_PROFILE",
            "name": "Update Profile",
            "providerId": "UPDATE_PROFILE",
            "enabled": true,
            "defaultAction": false,
            "priority": 40,
            "config": {}
        },
        {
            "alias": "VERIFY_EMAIL",
            "name": "Verify Email",
            "providerId": "VERIFY_EMAIL",
            "enabled": true,
            "defaultAction": false,
            "priority": 50,
            "config": {}
        },
        {
            "alias": "delete_account",
            "name": "Delete Account",
            "providerId": "delete_account",
            "enabled": false,
            "defaultAction": false,
            "priority": 60,
            "config": {}
        },
        {
            "alias": "update_user_locale",
            "name": "Update User Locale",
            "providerId": "update_user_locale",
            "enabled": true,
            "defaultAction": false,
            "priority": 1000,
            "config": {}
        }
    ],
    "browserFlow": "browser",
    "registrationFlow": "registration",
    "directGrantFlow": "direct grant",
    "resetCredentialsFlow": "reset credentials",
    "clientAuthenticationFlow": "clients",
    "dockerAuthenticationFlow": "docker auth",
    "attributes": {
        "cibaBackchannelTokenDeliveryMode": "poll",
        "cibaExpiresIn": "120",
        "cibaAuthRequestedUserHint": "login_hint",
        "oauth2DeviceCodeLifespan": "600",
        "clientOfflineSessionMaxLifespan": "0",
        "oauth2DevicePollingInterval": "5",
        "clientSessionIdleTimeout": "0",
        "parRequestUriLifespan": "60",
        "clientSessionMaxLifespan": "0",
        "clientOfflineSessionIdleTimeout": "0",
        "cibaInterval": "5"
    },
    "keycloakVersion": "18.0.0",
    "userManagedAccessAllowed": false,
    "clientProfiles": {
        "profiles": []
    },
    "clientPolicies": {
        "policies": []
    }
}
EOF
        destination = "local/realm-config.json"
      }
    }
  }
}