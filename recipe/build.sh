#!/usr/bin/env bash
set -ex

# TELEMAC home directory
export HOMETEL=$SRC_DIR/opentelemac

# Configure PATH and PYTHONPATH
export PATH=$HOMETEL/scripts/python3:$PATH
export PYTHONPATH=$HOMETEL/scripts/python3

cmake -S "$HOMETEL" -B "$HOMETEL/build" -G "Unix Makefiles" \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX="$PREFIX/opentelemac" \
   -DUSE_MPI=ON \
   -DUSE_MED=OFF \
   -DUSE_MUMPS=OFF \
   -DUSE_AED2=OFF \
   -DUSE_GOTM=OFF \
   -DBUILD_TELAPY=ON \
   -DBUILD_HERMES_WRAPPER=OFF

cmake --build "$HOMETEL/build" -j${CPU_COUNT}
cmake --install "$HOMETEL/build"

# Copy sources (needed at runtime for some TELEMAC operations)
mkdir -p $PREFIX/opentelemac/sources
mkdir -p $PREFIX/opentelemac/scripts
cp -r $HOMETEL/sources/* $PREFIX/opentelemac/sources
cp -r $HOMETEL/scripts/* $PREFIX/opentelemac/scripts

# AUTO activate/deactivate environment variables for TELEMAC
for CHANGE in "activate" "deactivate"; do
   mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
   cp "${RECIPE_DIR}/scripts/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done
