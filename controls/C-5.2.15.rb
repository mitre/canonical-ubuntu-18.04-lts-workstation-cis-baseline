# encoding: UTF-8

control "C-5.2.15" do
  title "Ensure only strong Key Exchange algorithms are used"
  desc  "Key exchange is any method in cryptography by which cryptographic keys
are exchanged between two parties, allowing use of a cryptographic algorithm.
If the sender and receiver wish to exchange encrypted messages, each must be
equipped to encrypt messages to be sent and decrypt messages received"
  desc  "rationale", "Key exchange methods that are considered weak should be
removed. A key exchange method may be weak because too few bits are used, or
the hashing algorithm is considered too weak. Using weak algorithms could
expose connections to man-in-the-middle attacks"
  desc  "check", "
    Run the following command and verify that output does not contain any of
the listed weak Key Exchange algorithms

    ```
    # sshd -T | grep kexalgorithms
    ```

    Weak Key Exchange Algorithms:

    ```
    diffie-hellman-group1-sha1
    diffie-hellman-group14-sha1
    diffie-hellman-group-exchange-sha1
    ```
  "
  desc "fix", "
    Edit the /etc/ssh/sshd_config file add/modify the KexAlgorithms line to
contain a comma separated list of the site approved key exchange algorithms

    Example:

    ```
    KexAlgorithms
curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256
    ```
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SC-8", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["14.4", "Rev_7"]
  tag cis_rid: "5.2.15"
end
