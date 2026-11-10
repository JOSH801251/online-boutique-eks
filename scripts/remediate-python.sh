
#!/usr/bin/env bash
set -e

echo "Starting Python dependency remediation..."

# Email Service
sed -i -E \
  -e 's/^certifi==.*/certifi==2026.10.18/' \
  -e 's/^pyasn1==.*/pyasn1==0.6.5/' \
  -e 's/^urllib3==.*/urllib3==2.8.0/' \
  src/emailservice/requirements.txt

# Recommendation Service
sed -i -E \
  -e 's/^certifi==.*/certifi==2026.10.18/' \
  -e 's/^pyasn1==.*/pyasn1==0.6.5/' \
  -e 's/^urllib3==.*/urllib3==2.8.0/' \
  src/recommendationservice/requirements.txt

# Load Generator
sed -i -E \
  -e 's/^brotli==.*/brotli==1.2.1/' \
  -e 's/^certifi==.*/certifi==2026.10.18/' \
  -e 's/^msgpack==.*/msgpack==1.2.3/' \
  -e 's/^python-engineio==.*/python-engineio==4.13.2/' \
  -e 's/^python-socketio==.*/python-socketio==5.16.2/' \
  -e 's/^urllib3==.*/urllib3==2.8.0/' \
  src/loadgenerator/requirements.txt

echo ""
echo "Python dependency updates completed."
