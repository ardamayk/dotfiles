single sign on SSO
don't use sms
2fa
fido u2f
fido2
dictionary attack
data breach
encrypted passwords
password
passphrase sequence of four or more words
password entropy

Several factors affect a password’s entropy and, in turn, its strength. You’ll need to consider your password’s:

    Length (in characters)
    Use of uppercase and lowercase letters
    Use of numeric characters
    Use of special symbols

Assuming you use a random string of characters, password entropy is measured in bits and depends on two main factors:

    The number of characters available in the character range chosen for the password
    The number of characters in the password

75 bit entropy

We calculate the maximum number of potential guesses using the calculation 2 ^ (number of bits). It’s how many times the number 2 doubles to reach the total number of bits

aim for 100 bits entropy at least
password blocklist

at least 14 character for passwords, at least 30 for passphrases assuming words unrelated

diceware list for random passhprases ?
https://proton.me/blog/what-is-password-entropy

signatures
handwritten signatures
digital signatures
electronic signature (e-signature)
public-key cryptography (asymmetric-key cryptography)
public key
private key

authentication, data integrity, non-repudiation

document
hash (message digest)
sign with private key
compute hash in receiving document, and verify received hash and calculated hash is same with public key

digital certificates
certificate authorities (CA)
public key infrastructure (PKI)

PGP, OpenPGP
OpenGPG CA
ProtonCA

Is digitally signing the same as encrypting?

Digital signatures use public-key cryptography(new window), but signing is different from encrypting.

    When you digitally sign data, you use your private key to create the signature, and the receiver verifies the signature using your public key. The main purpose of digital signatures is to verify who the data is from and check that it hasn’t been altered (authenticity and integrity).
    When you encrypt data, you use a person’s public key to transform it into unreadable ciphertext. The receiver uses their private key to decode it back into readable plaintext. The main purpose of encrypting data is to ensure that only authorized receivers can access it (confidentiality).

Digital signature FAQs
Is digitally signing the same as encrypting?

Digital signatures use public-key cryptography(new window), but signing is different from encrypting.

    When you digitally sign data, you use your private key to create the signature, and the receiver verifies the signature using your public key. The main purpose of digital signatures is to verify who the data is from and check that it hasn’t been altered (authenticity and integrity).
    When you encrypt data, you use a person’s public key to transform it into unreadable ciphertext. The receiver uses their private key to decode it back into readable plaintext. The main purpose of encrypting data is to ensure that only authorized receivers can access it (confidentiality).

What’s a hash function?

A hash function is an algorithm that turns an arbitrarily sized message, like an email, document, or other data, into a unique, fixed-length string of numbers and letters called a “hash” (also known as “message digest”). Hash functions are used in digital signatures for two reasons.

    Most common digital signature schemes can only sign and verify small messages. So hash functions map arbitrarily sized documents to a small, fixed-sized message that can be signed with these schemes without affecting security.
    A cryptographic hash function is collision-resistant(new window), which means it’s hard to find two messages that produce the same hash. A change to the original message will result in a different hash. So a hash can be used to verify that data hasn’t been tampered with.

What’s a digital certificate?

A digital certificate contains the public key of an individual or organization and verifies that the key belongs to them. Most digital certificates are issued and digitally signed by a certificate authority.
What’s a certificate authority (CA)?

A certificate authority (CA) is a trusted third party that verifies the public key and identity of a person or organization. A CA either creates a public/private key pair for them or stores an existing key pair in their name.

Once a CA confirms a subject’s identity, it issues a digital certificate for the subject. You can then use the certificate to verify that a subject’s public key belongs to them.
What’s public key infrastructure (PKI)?

Public key infrastructure (PKI) comprises all the hardware, software, policies, and security systems used to issue, manage, store, and revoke certificates — all of which ensure that the digital certificate verification process is trustworthy. For example, certificate authorities store private keys in a hardware security module(new window) so they can’t be extracted (although this doesn’t prevent certificates from being mistakenly signed).

# OATH

## OTP

SMS based
e-mail based
voice message; phone call based
2FA authenticor app based (TOTP and HOTP usally used here, but can be used any in any of this methods)

## TOTP - HOTP

shared secret key

Time based
Hash based

# FIDO 1.0

# FIDO U2F

universal 2nd factor
support for physical devices
used after username + password verification for second verification

# FIDO2

standardization for web and browsers added
support for biometrics and physical devices
passwordless log in

# BAKILACAKLAR!!!

https://www.aquasec.com/

---

proton non-residantal passkey sistemi kullaniyor
otp lar icin bir base32 veya qr ile bir sey shared olarak user ve cloud ustunde ayni anda bulunuyor guvenli degil, ss lere karsi guvensiz ama yubikey icine yazilinca bir daha cikmiyor
sms cok guvensiz, abd dinleme
mail guvensiz kullanicinin fiziksel olarak erisimi oldugunu degil sadece hesabin acik oldugunun testi bu, nromalde kullanici fiziksel olarak orada mi testi yapilmali
passkey ile username ve posta + sifre olmadan otomatik girme var. Eger sifre + username kombinasyonu var ve ise bu kesinlikle passkey olmuyor, buradan sonra passkey sorarsa 2fa oluyor.
yubikey kendi otp sistemi var ve buna gore her cihaz yubikey cloud ustunde kayitli olmus oluyor. bu sekilde 44 hanelik string kullanilarak bir otp sistemi kullaniliyor.

---

pcsd.service for smart action
https://bbs.archlinux.org/viewtopic.php?id=302082
