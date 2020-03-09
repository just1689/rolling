# Roll forward and back

## Requirements

- Each production deployment that is not a rollforward or back must be written to the history file.
- Assumes DAG deployments


## How to use

Run `./rollback.sh` to go to the version before the current version.

Run `./rollforward.sh` to roll to the version after the current version.  

