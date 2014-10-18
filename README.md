# Toby

Toby is a password manager. Toby was designed with two password categories in mind: personal passwords, and passwords that are to be shared within a team.

Note: A Demo account is provided for Toby. Username: Demo, Password: Demo. The Demo account may not change its own password, but is otherwise fully functional.

Passwords are encrypted and decrypted on the client side by the web application, using Toby passwords and encryption keys. The server never comes into contact with decrypted passwords.

To share passwords with a team, a group is first created with its own password. Team members are then invited to join the group. They must be provided the group password by other means; via PGP-encrypted email, for example. The shared group password is then used as the encryption key for group passwords. Team members may be assigned admin privileges, or granted read-only access to the group.

Any admin Team Member may invite additional team members, set their access, and export passwords. They may also change the group password---this re-encrypts the group passwords.

If a person leaves a team, Toby will be able to identify passwords that should be changed based on the leaving date. If a Toby password is lost, the password database may not be recovered.

## Future Features

- Keepass import/export
- Activity log
- Password generation
- Clipboard management

