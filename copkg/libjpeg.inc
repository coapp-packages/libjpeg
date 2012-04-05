@import "version.inc";
@import "outercurve.inc";

package {
    name: "libjpeg[${flavor}]";
    version: "${package-version}";
    arch : "${arch}";
    display-name: "libjpeg";
    location: "http://coapp.org/repository/${OutputFilename}";
    feed: "http://coapp.org/repository/packages.atom.xml";
    publisher: "CoApp Project";
}

metadata {
    summary: "liblibjpeg";
    description:  @"libjpeg"; 
    icon: @"libjpeg.png";
    author-version : "8c";
    bug-tracker: "https://github.com/coapp-packages/libjpeg/issues";
    stability : "0";
    licenses : {
        GPL
    };
}

license[GPL] {
    license-url: "";
    license-type: "GPL";
}

compatability-policy {
    minimum: "8.3.0.0";
    maximum: "${OneLessThanCurrent}"; // this is the default
    versions : {
        "8.0",
    }; // if not specified, find the versions by looking at the feeds and finding all the major/minor versions in range.
}

files[exes] {
    root: @"..\output\vc10\${arch}\Release\bin";
    
    include: {
        "*.exe",
    };
    
    trim-path: all;
};

files[dlls] {
    root: @"..\output\vc10\${arch}\Release\bin";
  
    include: {
        "*.dll",
    };
    
    trim-path: all;
};

files[files-to-sign] {
    include: { 
        exes,
        dlls
    };    
}

assembly[libjpeg[${flavor}]] {
    include : {
        dlls
    };
}

manifest[forexes] {
    assembly : {
        "libjpeg[${flavor}]"
    };
    
    include : { 
        exes
    };
}

application {
    include : {
        exes,
    };
}

package-composition {
    symlinks : { 
        exes => @"${bin}\${each.Name}" = @"${packagedir}\${each.Name}";
    };
}

signing {
    attributes : {
        company="Outercurve Foundation",
        description="libjpeg",
        product-name="libjpeg",
        product-version="${package-version}",
        file-version="${package-version}",
    };
    
    replace-signature: true; 
    include: { 
        files-to-sign
    };    
}