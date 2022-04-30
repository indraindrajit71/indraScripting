#!/bin/bash

echo -e "Please provide the filename you want to create: \c"
read -r filename
touch /$PWD/$filename.sh
chmod 755 /$PWD/$filename.sh
echo "#!/bin/bash" > /$PWD/$filename.sh
echo "# Purpose:" >> /$PWD/$filename.sh
echo "# Version:" >> /$PWD/$filename.sh
echo "# Creation-Date:" `date` >> /$PWD/$filename.sh
echo "# Modified-date:" >> /$PWD/$filename.sh
echo "# Author:" >> /$PWD/$filename.sh
echo "# START #" >> /$PWD/$filename.sh
echo "# END #" >> /$PWD/$filename.sh
