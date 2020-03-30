# encoding: UTF-8

control "C-1.1.1.6" do
  title "Ensure mounting of squashfs filesystems is disabled"
  desc  "The `squashfs` filesystem type is a compressed read-only Linux
filesystem embedded in small footprint systems (similar to `cramfs` ). A
`squashfs` image can be used without having to first decompress the image."
  desc  "rationale", "Removing support for unneeded filesystem types reduces
the local attack surface of the system. If this filesystem type is not needed,
disable it."
  desc  "check", "
    Run the following commands and verify the output is as indicated:

    ```
    # modprobe --showconfig | grep squashfs

    install /bin/true
    ```

    ```
    # lsmod | grep squashfs

    ```
  "
  desc "fix", "
    Edit or create a file in the `/etc/modprobe.d/` directory ending in .conf

    Example: `vi /etc/modprobe.d/squashfs.conf`

    and add the following line:

    ```
    install squashfs /bin/true
    ```

    Run the following command to unload the `squashfs` module:

    ```
    # rmmod squashfs
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
  tag nist: ["CM-6", "Rev_4"]
  tag cis_level: 3
  tag cis_controls: ["5.1", "Rev_7"]
  tag cis_rid: "1.1.1.6"
end
