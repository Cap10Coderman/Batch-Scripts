
@echo off

:loop

set /p s3url="ENTER THE S3 URL "
set OUTPUT_FILE=S3Pre.txt
aws s3 presign %s3url% --expires-in 604000 --region ap-south-1 --profile (Configured aws cli profile) > %OUTPUT_FILE%
echo COPY THE PRESIGNED URL
type %OUTPUT_FILE%


set /p choice="Press 'r' to re-generate the presigned URL again or any other key to exit. Press enter after...."

if '%choice%'=='r' (
    goto :loop
)else (
    goto :eof
)

:eof

