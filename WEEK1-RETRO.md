Day 1 — System Reverse Engineering + Terminal Mastering

# What i learned:
- how to inspect os internal purely from the terminal.
- NVM make switchung node version seamless for multi project enviroment.
- the real diffrence between Buffer vs Stream
- os module in node can expose deep system information

# What Broke:
- memory spike with fs.readfile on 50mb-process nearly hit memory limit during the bench mark

Day 2 — Node CLI App + Concurrency + Large Data Processing

# What I Learned:
- how to build a proper cli tool with argument passing
- promise.all for parallel chunk processing
- benchmarking concurrency level 1,4,8

# What Broke:
-race condition with shared counters in prallel chunks switch to returning result per chunk and merging after promise.all
- --minLen filter accciedntall applied before duplicate,prodeuce wrong unique word count
-some word were split mid words across chund boundry,crrupt the word count

#Day 3 — Git Mastery: Reset, Revert, Cherry-pick, Bisect, Stash:

# What I Learned:
- git bisect -bianry search through commit find the bugs introduce commit in step 
- diffrence between git reset vs git revert
- git stats/git stats apply is essential for context switching without bad commit
- creating merge conflict and resolving it manually

# What Broke:
- goit reset --hard on shared branch -had to be undone with git reflog 
- merge conflict resolving accedntally deleted both version insted of combining them

#Day 4 — HTTP / API Forensics (cURL + Postman + Headers)

# What i learned:
- nslookup and traceroute revealed the actual network path to a server
- Building a Node HTTP server with /echo, /slow, and /cache endpoints deepened my understanding of how servers construct responses.
- Fake Authorization headers are silently accepted by most APIs 

# What Broke:
- ETag caching test failed initially because the API returned a different ETag on each request


#Day 5 — Automation & Mini-CI Pipeline

# What i learned:
- ESLint + Prettier as commit gates bad fromatting is caught before it ever entery
- Shell scripting with validate.sh — checking directory existence, JSON validity with jq, and appending timestamped logs.
- Husky pre-commit hooks make quality checks automatic and non-negotiable.
- Creating a .tgz build artifact with a SHA checksum is the foundation of reproducible builds.

# What Broke:
- Husky hook wasn't running — chmod +x .husky/pre-commit was missing;
- validate.sh failed silently because jq was not installed on the machine