%-------------------------------------------------------------------------------
% Main Info
%-------------------------------------------------------------------------------

\ProvidesClass{108th}[2022/01/30 v1.0 108th Document Class]
\NeedsTeXFormat{LaTeX2e}

% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}

\ProcessOptions

\LoadClass{article}

%-------------------------------------------------------------------------------
% 3rd party libs
%-------------------------------------------------------------------------------

% Required for font / color management
\RequirePackage[quiet]{fontspec}
\RequirePackage[table]{xcolor}

% margins etc
\RequirePackage{geometry}

% nicely referenced sections
\RequirePackage{nameref}

% Drawing
\RequirePackage{tikz}
\usetikzlibrary{fadings}  % Anchoring / east west etc.

% titleps from titlesec for nice heading styles with links
\RequirePackage[pagestyles]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[title]{appendix}
\RequirePackage{hyperref}

% Nice fancy headers / Footers (and page numbers)
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% EnumItem titles
\RequirePackage[shortlabels]{enumitem}

% Wrapping Figures
\RequirePackage{wrapfig}

% aligning images
\RequirePackage{graphbox}

% Nicer tables, and for specialrule, and coloring said specialrule, and makecell for pretty contents top aligned
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{colortbl}
\RequirePackage{makecell}

% For FP math (used in \sidebyside)
\RequirePackage[nomessages]{fp}

% For nice fractions
\RequirePackage{xfrac}

% adjustwidth
\RequirePackage{changepage}

% Needed for matchign appendicies
\RequirePackage{etoolbox}

%-------------------------------------------------------------------------------
% Fonts
%-------------------------------------------------------------------------------

\newfontfamily\fontbody{Calibri}
\newfontfamily\fontsection{Calibri Light}

%-------------------------------------------------------------------------------
% COLORS
%-------------------------------------------------------------------------------
\definecolor{body}{rgb}{0, 0, 0}
\definecolor{rule}{rgb}{0.5,0.5,0.5}
\definecolor{footerpage}{rgb}{.329,.553,.831}

%-------------------------------------------------------------------------------
% TITLE PAGE HELPERS
%-------------------------------------------------------------------------------

\newcommand{\version}[1]{\makeatletter\def\@version{#1}\makeatother}
\newcommand{\subtitle}[1]{\makeatletter\def\@subtitle{#1}\makeatother}
\newcommand{\summary}[1]{\makeatletter\def\@summary{#1}\makeatother}
\newcommand{\objectives}[1]{\makeatletter\def\@objectives{#1}\makeatother}
\newcommand{\trainee}[1]{\makeatletter\def\@trainee{#1}\makeatother}
\newcommand{\instructor}[1]{\makeatletter\def\@instructor{#1}\makeatother}
\newcommand{\evaluation}[1]{\makeatletter\def\@evaluation{#1}\makeatother}


\newcommand{\appliesto}[1]{\makeatletter\def\@appliesto{#1}\makeatother}
\newcommand{\type}[1]{\makeatletter\def\@type{#1}\makeatother}
\newcommand{\published}[1]{\makeatletter\def\@published{#1}\makeatother}
\newcommand{\owner}[1]{\makeatletter\def\@owner{#1}\makeatother}
\newcommand{\acknowledgements}[1]{\makeatletter\def\@acknowledgements{#1}\makeatother}
\newcommand{\changes}[1]{\makeatletter\def\@changes{#1}\makeatother}

%-------------------------------------------------------------------------------
% References
%-------------------------------------------------------------------------------

% Reference to include chapter and title
\newcommand*{\fullref}[1]{%
  \hyperref[{#1}]{\underline{\autoref*{#1}: \nameref*{#1}}}} % One single link

\def\sectionautorefname{Section}
\def\subsectionautorefname{Section}
\def\subsubsectionautorefname{Section}

%-------------------------------------------------------------------------------
% Commands
%-------------------------------------------------------------------------------

% We have a lot of 132nd / 108th and since we can't have numbers in commands
% we use nd / th instead (th is originally for thorn but we won't be needing
% that

\newcommand{\nd}{{\fontsize{9pt}{1em}\fontbody nd }}
\renewcommand{\th}{{\fontsize{9pt}{1em}\fontbody th }}

% approx
\renewcommand{\textapprox}{\raisebox{0.9ex}{\texttildelow}}


% Rule Colors
\let\old@rule\@rule
\def\@rule[#1]#2#3{\textcolor{rule}{\old@rule[#1]{#2}{#3}}}

% Underline Links
\let\oldhref\href
\renewcommand\href[2]{\underline{\oldhref{#1}{#2}}}

% Nice little boxed section

% Make parboxes have a nice parskip
\let\oldparbox\parbox
\let\parskip\parskip
\renewcommand\parbox[3][c]{\oldparbox[#1]{#2}{\setlength{\parskip}{1em}#3}}

\newcommand{\boxed}[2][]{%
  \noindent\fbox{%
    \parbox{\dimexpr\linewidth-2\fboxsep-2\fboxrule}{
      \if\relax\detokenize{#1}\relax {} \else \leavevmode\color{#1} \fi
      #2
    }%
  }
}

%-------------------------------------------------------------------------------
% Section Heading Formatting
%
% \titlespacing{command}{left spacing}{before spacing}{after spacing}[right]
%-------------------------------------------------------------------------------

% Start a new page for each section
\newcommand{\sectionbreak}{\clearpage}

% more subsections
\setcounter{secnumdepth}{4}

% General format of <number>. Title
\titlelabel{\thetitle.\hskip0.25em\relax}

% SECTION

\titlespacing{\section}{0pt}{0em}{-.5em}

\titleformat*{\section}
  {\fontsize{16pt}{1em}\color{black!50}\fontsection}

% SUBSECTION
\titlespacing{\subsection}{0pt}{0em}{-.5em}

\titleformat{\subsection}
  {\fontsize{11pt}{1em}\color{black!50}\fontsection\itshape}
  {\thetitle\hskip0.25em\relax}
  {10pt}{}{}

\titleformat{name=\subsection,numberless}
  {\addtocounter{subsection}{1}\fontsize{11pt}{1em}\color{black!50}\fontsection\itshape}
  {\thetitle\hskip0.25em\relax}
  {0pt}{}{}

% SUBSUB SECTION is identical to subsection
\titlespacing{\subsubsection}{0em}{0em}{-0.5em}

\titleformat{\subsubsection}
  {\fontsize{11pt}{1em}\color{black!50}\fontsection\itshape}
  {\thetitle\hskip0.25em\relax}
  {0pt}{}{}

\titleformat{name=\subsubsection,numberless}
  {\addtocounter{subsubsection}{1}\fontsize{11pt}{1em}\color{black!50}\fontsection\itshape}
  {\thetitle\hskip0.25em\relax}
  {0pt}{}{}

%-------------------------------------------------------------------------------
% TOC Formatting
%-------------------------------------------------------------------------------

\renewcommand\contentsname{Table of Contents\vspace{0.5em}}

\titlecontents{section}[1.7em]           % left margin
  {\vspace{-.75\parskip}}            % above code
  {\contentslabel[\thecontentslabel.]{1.7em}}  % numbered format
  {}                       % unnumbered
  {\hfill\contentspage}            % filler-page-format

\titlecontents{subsection}[3.2em]         % left margin
  {\vspace{-.75\parskip}}            % above code
  {\contentslabel[\thecontentslabel~]{2.5em}}  % numbered format
  {}                       % unnumbered
  {\hfill\contentspage}            % filler-page-format

\titlecontents{subsubsection}[4.9em]       % left margin
  {\vspace{-.75\parskip}}            % above code
  {\contentslabel[\thecontentslabel~]{3.5em}}  % numbered format
  {}                       % unnumbered
  {\hfill\contentspage}            % filler-page-format


%-------------------------------------------------------------------------------
% TOC APPENDIX FORMATTING
%-------------------------------------------------------------------------------

% TOC spacing
\renewcommand{\appendixtocname}{List of appendices\vspace{0.5em}}

\patchcmd{\appendices}{\quad}{: }{}{}

\let\oldappendix\appendices
\renewcommand{\appendices}{%
  \clearpage
  \renewcommand{\thesection}{\Roman{section}}
  % From now, everything goes to the app - file and not to the toc
  \let\tf@toc\tf@app
  \addtocontents{app}{\protect\setcounter{tocdepth}{1}}
  \immediate\write\@auxout{%
    \string\let\string\tf@toc\string\tf@app^^J
  }
  \oldappendix
}%

\newcommand{\listofappendices}{%
  \begingroup
  \renewcommand{\contentsname}{\appendixtocname}
  \let\@oldstarttoc\@starttoc
  \def\@starttoc##1{\@oldstarttoc{app}}
  \tableofcontents% Reusing the code for \tableofcontents with different
  %\contentsname and different file handle app
  \endgroup
}

%-------------------------------------------------------------------------------
% FOOTER
%-------------------------------------------------------------------------------
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

\fancyfoot[R]{%
  %\vskip-14pt%
  \fontsize{12pt}{1em}\fontbody{\color{footerpage}Page} \thepage~|
  \pageref{LastPage}
}

%-------------------------------------------------------------------------------
% Title Page
%-------------------------------------------------------------------------------

\renewcommand\maketitle{%
  \begin{titlepage}
    {
      \centering
      \fontsize{40pt}{0em}\fontbody
      \noindent\rule{\linewidth}{0.75pt}\\[.25em]
        \makeatletter\@title\makeatother\\[.25em]
        \fontsize{16pt}{0em}\fontbody
      \noindent\rule{\linewidth}{0.75pt}\\[0.5em]
      \fontsize{16pt}{1.3em}\fontbody
        \makeatletter\@subtitle\makeatother\\[15pt]
      \includegraphics[width=2in]{132nd_Logo_new_trans}\\

      \vfill

      \fontsize{11pt}{1em}\fontbody

      \underline{\href{www.132virtualwing.org}{www.132virtualwing.org}}\\
      This work is licensed under a
      \underline{\href{https://creativecommons.org/licenses/by-sa/3.0/}{Creative
       Commons Attribution-ShareAlike 3.0 Unported License}}.

    }
  \end{titlepage}
}

\def\changes{}
\newcommand\change[2]{
  \expandafter\def\expandafter\changes\expandafter{%
    \changes
    #1: & #2 \\
  }
}

\newcommand\metatable{
  \newpage
  {
    \makeatletter
    \setlength{\parsep}{1em}

    \fontsize{28pt}{0em}\fontbody
    \@title
    \fontsize{12pt}{0.7em}\fontbody

    \rowcolors{2}{white}{gray!10}
    \begin{tabularx}{\textwidth}{ r!{\color{black!50}\vrule width 1pt}X }
      {\color{black!50}APPLIES TO:} & \textbf{\@appliesto} \\
      \arrayrulecolor{black!50}\specialrule{0.1em}{0em}{0em}
      {\color{black!50}TYPE:} & \textbf{\@type} \\
      {\color{black!50}VERSION:} & \@version \\
      {\color{black!50}PUBLISHED:} & \@published \\
      {\color{black!50}DOCUMENT RESPONSIBLE:} & \@owner \\
      {\color{black!50}ACKNOWLEDGEMENTS:} & \@acknowledgements \\
      {\color{black!50}SUMMARY OF CHANGES:} & {
        \setlength\parskip{0em}
        \setlength{\tabcolsep}{0.25em}
        \fontsize{11pt}{1.2em}\fontbody
        \def\arraystretch{1.3}
        \vspace*{-1.2em} % This is important to space it correctly...weirdly
        \begin{tabularx}{\linewidth}{rX}
            \changes
        \end{tabularx}
      }
    \end{tabularx}

    \makeatother
  }
}

\newcommand\sidebyside[3]{
  \FPeval{\secondpage}{round(1-#1-0.05,3)}

  \begin{minipage}[t]{#1\textwidth}
    #2
  \end{minipage}\hfill
  \begin{minipage}[t]{\secondpage\textwidth}
    #3
  \end{minipage}
}

%-------------------------------------------------------------------------------
% LISTS / ENUMERATIONS
%-------------------------------------------------------------------------------

\SetLabelAlign{LeftAlignWithIndent}{\makebox[0em][l]{#1}}

\newenvironment{orderedlist}[1][]
  {%
    \begin{enumerate}[%
      leftmargin=*,
      labelsep=1.25em,
      align=LeftAlignWithIndent,
      label={\fontsize{12pt}{1.25em}\color{black!50}\fontbody{\ifx\\#1\\
      \theenumi. \else #1.\theenumi \fi}}
    ]
    % These spacings make for easier to read multiline lists
    \setlength\itemsep{-0.2em}
    \fontsize{12pt}{1.2em}\fontbody
  }
  {\end{enumerate}}

\newenvironment{sectionenumerate}
  {\begin{orderedlist}[\thesection]}
  {\end{orderedlist}}

\newenvironment{subsectionenumerate}
  {\begin{orderedlist}[\thesubsection]}
  {\end{orderedlist}}

\newenvironment{subsubsectionenumerate}
  {\begin{orderedlist}[\thesubsubsection]}
  {\end{orderedlist}}

\let\tempone\itemize
\let\temptwo\enditemize

\renewenvironment{itemize}{%
  %\setlength\parskip{.25em}
  \tempone[noitemsep,topsep=0pt,partopsep=0pt]
  %\setlength{\itemsep}{1pt}
  %\setlength{\parsep}{0pt}
}{\temptwo}

% Set 2nd indent to stars
\setlist[itemize,2]{label={$\circ$}}

%-------------------------------------------------------------------------------
% FORMAT
%-------------------------------------------------------------------------------

\newcommand\narrow[1]{
  \begin{indentblock}
    #1
  \end{indentblock}
}

\newenvironment{indentblock}{%
  \begin{adjustwidth}{.5in}{.5in}
}{%
  \end{adjustwidth}
}

%-------------------------------------------------------------------------------
% GENERAL INIT
%-------------------------------------------------------------------------------

\geometry{top=1in,left=0.75in,right=0.75in,bottom=1in}
%\setlength{\headsep}{0mm}

\setlength{\parindent}{0mm}
\setlength{\parskip}{1em}

\setmainfont{Calibri}
\fontsize{12pt}{1em}\fontbody
\pagestyle{fancy}

% We don't want hyphenation
\hyphenpenalty=10000

% Store the above for minipage
\newcommand{\@minipagerestore}{%
  \setlength{\parindent}{0mm}
  \setlength{\parskip}{1em}
  \hyphenpenalty=10000
}