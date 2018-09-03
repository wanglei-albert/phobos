#!/bin/bash

# -------------------------------------------------------------------------------
# This file is part of Phobos, a Blender Add-On to edit robot models.
# Copyright (C) 2018 University of Bremen & DFKI GmbH Robotics Innovation Center

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
# -------------------------------------------------------------------------------

echo "Start sphinx doc generation..."
rm phobos/__init__.py
cd doc
make html
cd ..
git checkout -- phobos/__init__.py
git checkout gh-pages
rm -rf *.html *.js *.inv _sources _static
mv doc/_build/html/* .
echo "Please commit and push the changes to publish the new doc on https://dfki-ric.github.io/phobos"

