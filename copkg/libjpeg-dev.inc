@import "version.inc" ;
@import "outercurve.inc" ;

package {
    name: "libjpeg-dev[${flavor}]";
    version: "${package-version}";
    arch : "${arch}";

    display-name: "libjpeg Developer library";
}

metadata {
    summary: "The libjpeg developer library";
    description: @"libjpeg"; 

    icon: @"libjpeg.png";
    
    author-version : "8c";
    bug-tracker: "https://github.com/coapp-packages/libjpeg/issues";
    stability : "0";
    licenses : {
        GPL
    };
}

files[libs] {
    root: @"..\output\vc10\${arch}\Release\bin\";
    
    include: {
        "*.lib",
    };
    
    trim-path: all;
};

requires {
    package: "libjpeg-dev-common-${package-version}-any-${Package.PublicKeyToken}";
    package: "libjpeg[${flavor}]-${package-version}-${Package.Architecture}-${Package.PublicKeyToken}";
}

developer-library[libjpeg] {
    libraries : {
        libs
    };
}