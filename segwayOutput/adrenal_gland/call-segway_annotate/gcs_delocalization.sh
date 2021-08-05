source '/cromwell_root/gcs_transfer.sh'

timestamped_message 'Delocalization script execution started...'

# segway-testing
delocalize_050f0aa510f871fcd9b617f0b75e649b=(
  "encode-segway"       # project
  "3"   # max attempts
  "0" # parallel composite upload threshold, will not be used for directory types
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/memory_retry_rc"
  "/cromwell_root/memory_retry_rc"
  "optional"
  "text/plain; charset=UTF-8"
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/rc"
  "/cromwell_root/rc"
  "required"
  "text/plain; charset=UTF-8"
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/monitoring.log"
  "/cromwell_root/monitoring.log"
  "required"
  "text/plain; charset=UTF-8"
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/stdout"
  "/cromwell_root/stdout"
  "required"
  "text/plain; charset=UTF-8"
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/stderr"
  "/cromwell_root/stderr"
  "required"
  "text/plain; charset=UTF-8"
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/segway.bed.gz"
  "/cromwell_root/segway.bed.gz"
  "required"
  ""
  "directory"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/glob-e59fb0efcac8bc0ed00369eb031c972e/"
  "/cromwell_root/glob-e59fb0efcac8bc0ed00369eb031c972e"
  "required"
  ""
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/glob-e59fb0efcac8bc0ed00369eb031c972e.list"
  "/cromwell_root/glob-e59fb0efcac8bc0ed00369eb031c972e.list"
  "required"
  ""
  "file"
  "gs://segway-testing/segway/35f429b3-1726-4e57-b181-ea87e6c73277/call-segway_annotate/training_params.tar.gz"
  "/cromwell_root/training_params.tar.gz"
  "required"
  ""
)

delocalize "${delocalize_050f0aa510f871fcd9b617f0b75e649b[@]}"
      
timestamped_message 'Delocalization script execution complete.'