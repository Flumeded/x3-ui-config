# 📦 3x-ui Server Deployment with Ansible

This Ansible playbook automates the deployment of a **3x-ui server** — a VPN panel designed to operate effectively  in regions with strict internet censorship and filtering.

## Features

### 3x-ui VPN Panel  
A full-featured multi-protocol VPN management interface, deployed in Docker.

### Domain-based VLESS Configuration  
The setup uses a legitimate domain with a dummy public-facing website, making VPN traffic blend in with regular HTTPS requests.

### Fake Website Deployment  
A simple NGINX-based dummy website is deployed to act as a domain front, helping the domain appear legitimate while the actual VPN endpoint runs on a hidden subpath.

### Let's Encrypt Integration via Certbot  
SSL certificates are automatically obtained using Certbot.  
A cron-based job is configured to renew the certificates periodically

# ▶️ Running the Playbook
* Populate the inventory
* Install required roles first
```bash
ansible-galaxy install -r requirements.yml
```
* Then run the playbook
```bash
ansible-playbook -i inventory/hosts.yml deployment.yml --vault-pass-file ~/vault-pass
```

## ⚙️ Inbounds Configuration

### Connection Settings

- **Port**: `443`
- **Fallback Destination Port**: `1337`
- **Transmission**: `TCP (RAW)`

---

### TLS Security

- **Security Mode**: `TLS`
- **Cipher Status**: `Auto`
- **Min TLS Version**: `1.2`
- **Max TLS Version**: `1.3`
- **uTLS Fingerprint**: `Chrome`
- **ALPN**: `http/1.1`

---

### Certificate Verification

- **VerifyPeerCertInNames**:  
  `dns.google`, `cloudflare-dns.com`

---

### TLS Certificate Paths

- **Public Key**:  
  `/root/cert/live/<domain>/fullchain.pem`

- **Private Key**:  
  `/root/cert/live/<domain>/privkey.pem`

## 🖥️ 3x-ui Panel Settings

### General

- **Listen Domain**: `<domain>`  
- **Listen Port**: `2053`  
- **URI Path**: `<obfuscated-path>`

### Certificates

- **Public Key Path**:  
  `/root/cert/live/<domain>/fullchain.pem`

- **Private Key Path**:  
  `/root/cert/live/<domain>/privkey.pem`

