
data "aci_tenant" "conmurph" {
  name  = "conmurph"
}

resource "aci_application_profile" "application_2" {
  tenant_dn  = "${data.aci_tenant.conmurph.id}"
  name       = "application_2"
}

resource "aci_application_epg" "application_2" {
    application_profile_dn  = "${aci_application_profile.application_2.id}"
    name                              = "application_2"
}

resource "aci_bridge_domain" "application_2" {
  tenant_dn   = "${data.aci_tenant.conmurph.id}"
  name        = "application_2"
  description = "This bridge domain is created by terraform ACI provider"
}

resource "aci_subnet" "application_2" {
  parent_dn                    = "${aci_bridge_domain.application_2.id}"
  ip                                  = "2.2.2.253/24"
  description                         = "This subject is created by terraform"
}
