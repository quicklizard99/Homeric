VERSION=`cat DESCRIPTION  | grep Version: | sed s/.*:\ //g`
echo Building Homeric ${VERSION} using `R --version | head -1`
rm -rf build  && \
    mkdir build && \
    cd build && \
    R CMD build --compact-vignettes=gs .. && \
    ~/local/R-devel/bin/R CMD check --as-cran Homeric_${VERSION}.tar.gz && \
    R CMD INSTALL --build --html Homeric_${VERSION}.tar.gz
