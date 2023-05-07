variable "createprivkey" {
    type = bool
    default = false
}
variable "key_name" {
    type = string
    default = "terra-Key"
}

variable "tags" {
    type = map(string)
}

variable "public_key" {
    type = string
    #default = "key/terraformkey.pub"
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKjIDKbBdSKt/7BDtkBLQRos5fVl7lkWbs14O/G3fjF1nCLqgBCB2AL4Wj+5VD+AxGjTTimvi4H+aXJRZ4pFmkqilg+eVy+nFPiM1FcNKhLruWvRbDZanomz8sHzsq8I8H20dyrDatYwc51Q5TVC40pnf//GQZhEVZ0WMsOP86FWPQRFNlLco4FzC/6QFIKvbyhN7PFl8WflcOP4IRtiz+TON9AKpzDbjrzHqHWPj+2NxSiJX/HHcOLldt1xgy8W/RarZSaUmjA+0yVFSXeqyBjom2N7CACw2z8H1H7WC2HZBMIrSmx4dEu4VHdFMoDDs4OmmnO2XBN1polI7kJOMz rsa-key-20220622"
}

variable "passpublickey" {
    type = bool
    default = false 
}