#
# OscarForHomalg: Differential modules
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2019.04.10") then
    Error("AutoDoc version 2019.04.10 or newer is required.");
fi;

latex_preamble := """
\usepackage{amsmath}
\usepackage[T1]{fontenc}
\usepackage{tikz}
\usetikzlibrary{shapes,arrows,matrix}
\usepackage{faktor}
""";

AutoDoc( 
        rec(
            gapdoc := rec( LaTeXOptions := rec( LateExtraPreamble := latex_preamble ) ),
            scaffold := rec( entities := [
                                     "IO",
                                     "IO_ForHomalg",
                                     "JuliaInterface",
                                     "OscarForHomalg",
                                     ],
                             ),
            
            autodoc := rec( files := [ "doc/Doc.autodoc" ] ),

            maketest := rec( folder := ".",
                             commands :=
                             [ "LoadPackage( \"OscarForHomalg\" );",
                               "LoadPackage( \"GaussForHomalg\" );",
                               "LoadPackage( \"Modules\" );",
                             ],
                           ),
            extract_examples := true,
            )
);

QUIT;
