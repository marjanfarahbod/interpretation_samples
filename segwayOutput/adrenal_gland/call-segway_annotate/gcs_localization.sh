source '/cromwell_root/gcs_transfer.sh'

timestamped_message 'Localization script execution started...'



# Localize singleton file 'gs://caper-data/scripts/resource_monitor/resource_monitor.sh' to '/cromwell_root/monitoring.sh'.
singleton_file_to_localize_c303759dff8487d70205b42d13ace644=(
  "encode-segway"
  "3"
  "gs://caper-data/scripts/resource_monitor/resource_monitor.sh"
  "/cromwell_root/monitoring.sh"
)

localize_singleton_file "${singleton_file_to_localize_c303759dff8487d70205b42d13ace644[@]}"
       



# Localize files from source bucket 'segway-testing' to container parent directory '/cromwell_root/segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_train'.
files_to_localize_9c153ce62b5b566ff1022bd26db34411=(
  "encode-segway"   # project to use if requester pays
  "3" # max transfer attempts
  "/cromwell_root/segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_train/" # container parent directory
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_train/traindir.tar.gz"
)

localize_files "${files_to_localize_9c153ce62b5b566ff1022bd26db34411[@]}"
       


# Localize files from source bucket 'segway-testing' to container parent directory '/cromwell_root/segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-make_genomedata'.
files_to_localize_806e0531bcb71c0f269d69150b1d9622=(
  "encode-segway"   # project to use if requester pays
  "3" # max transfer attempts
  "/cromwell_root/segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-make_genomedata/" # container parent directory
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-make_genomedata/files.genomedata"
)

localize_files "${files_to_localize_806e0531bcb71c0f269d69150b1d9622[@]}"
       


# Localize files from source bucket 'segway-testing' to container parent directory '/cromwell_root'.
files_to_localize_10c9405ccbd9a7214f056a79a8bc704e=(
  "encode-segway"   # project to use if requester pays
  "3" # max transfer attempts
  "/cromwell_root/" # container parent directory
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/script"
)

localize_files "${files_to_localize_10c9405ccbd9a7214f056a79a8bc704e[@]}"
       
timestamped_message 'Localization script execution complete.'