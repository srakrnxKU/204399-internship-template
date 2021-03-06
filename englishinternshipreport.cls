\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{internshipreport}[Report template, modified for Kasetsart Internship report.]

% Pass arguments
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions

% Load classes
\LoadClass[titlepage]{extarticle}

% Custom settings
% Thai language support
\RequirePackage{xltxtra} 
\XeTeXlinebreaklocale "th_TH"

% Typeface
\RequirePackage{fontspec}
\defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
\setmainfont{TH Sarabun New}
\setmonofont{Tlwg Typist}

% Typography
\RequirePackage{indentfirst}
\setlength{\parindent}{0.5in}
\renewcommand{\normalsize}{\fontsize{12}{16}\selectfont}
\renewcommand\large{\@setfontsize\large{13.5pt}{18}}
\renewcommand\Large{\@setfontsize\Large{15pt}{20}}
\renewcommand\LARGE{\@setfontsize\LARGE{17.5pt}{22}}

% Margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Title
\RequirePackage[compact]{titlesec}
\newcommand{\sectionbreak}{\clearpage}
\titleformat{\section}[display]{\centering\Large\bfseries}{Chapter \thesection}{0pt}{}
\titleformat{\subsection}{\bfseries\large}{\thesubsection}{1em}{}

% Page numbering
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}

% Fields on the cover
\newcommand\location[1]{\renewcommand\@location{#1}}
\newcommand\@location{\@latex@error{No \noexpand\location given}\@ehc}
\newcommand\studentid[1]{\renewcommand\@studentid{#1}}
\newcommand\@studentid{\@latex@error{No \noexpand\studentid given}\@ehc}

% Table of Contents
\RequirePackage{titletoc}
% \renewcommand{\contentsname}{สารบัญ}
% \renewcommand{\listfigurename}{สารบัญภาพ}
% \renewcommand{\listtablename}{สารบัญตาราง}
\setcounter{tocdepth}{1} 
\titlecontents{section}[4em]{}{\contentslabel[Chapter \thecontentslabel]{4em}}{\hspace*{-4em}}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{figure}[4em]{}{\contentslabel[Figure \thecontentslabel]{4em}}{\hspace*{-4em}}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{table}[4em]{}{\contentslabel[Table \thecontentslabel]{4em}}{\hspace*{-4em}}{\titlerule*[1pc]{.}\contentspage}

% Table and Figure captions
\RequirePackage{caption}
% \captionsetup[table]{name=ตารางที่ }
% \captionsetup[figure]{name=ภาพที่ }

% Cover
\newcommand{\maketitlepage}{%
    \begin{center}%
        \includegraphics[width=3cm]{logo.png} \par%
        \vspace{1em}
        \textbf{\LARGE Internship Report} \par%
        \vspace{1em}
        \textbf{\Large \@title} \par%
        \vspace{1em}
        \textbf{\Large At \@location} \par%
        \vskip 10em%
        {\Large
            \textbf{\@author} \par%
            \textbf{Student ID \@studentid} \par%
        }%
        \vfill%
        \textbf{\Large% 
            Academic Year \@date \\%
            Department of Computer Engineering, Faculty of Engineering \\%
            Kasetsart University \\%
        }\par
    \end{center}\par
    \end{titlepage}%
}

\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small%
  \let\footnoterule\relax%
  \let \footnote \thanks%
  \maketitlepage%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\endinput
