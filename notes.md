# James Chabot-Weingart
- james.chabotweingart@gmail.com
- https://github.com/JamesC-W

## Built
- Added Deployment Status and Instances to show.html.heex
- Added lib/fly/periodically.ex to schedule queries against GraphQL to refresh index apps list and show app details - current interval 5 seconds
- Added page_title to index.ex mount/3 and show.ex mount/3, which will allow tab recognition and navigation
- Added title/alt tags to the svgs in show.html.heex that convey information, for screen reader accessibility- started from https://stackoverflow.com/questions/4697100/accessibility-recommended-alt-text-convention-for-svg-and-mathml
- Had to flip the releases query in Fly.Client.fetch_app/1 from last: 5 to first: 5. Not sure if the ordering changed in GraphQL. Should follow up to ensure that there is a consistent ordering now coming back from the query. If not, we can add an order by clause on the nodes.version or nodes.createdAt

## Future Work
- Tests: ensure index app list and show app details are correct, app creation/destruction, org membership changes
- periodically.ex @work_interval value should come from environmental variable to make it easy to tune for performance and load
- Currently the show page Deployment Status causes awkwardness with the Timeline on wide screens, consider removing it entirely when Deployment Status is null
- Consider adding flyctl apps functionality buttons: scale, destroy, move org, restart, suspend, resume
- Add ordering and filtering options to index apps list and show Process Groups and Instances lists
- Consider design for mobile: View button with link on show page is absent for anything below 640 width
- Any additional accessibility considerations - screen readers, keyboard navigation, color blindness
- Harmonize titles of index and show with other pages and subdomains of fly.io
- Harmonize header icon, header links, favicon, and color scheme with other pages and subdomains of fly.io
- flyctl/GraphQL/API/WebUI synchronization to ensure schema and functionality changes - automation/templating? Need to choose source of truth, currently defaulting to flyctl as authoritative
- Additional logging will inevitably be required
- Research A/B testing - Phoenix on Elixir equivalent of A/Bingo (https://github.com/ryanb/abingo) by @patio11. Cursory search shows https://github.com/alvesdan/abex
- Consider graphical additions for overview and individual apps (pageviews, queries, transactions, estimated costs), useful for operations centers. Might not be practical to build it into this app, alternatively offer templating and assistance to customers.
- Include info from flyctl info: protocols/ports, IPv4 addresses, IPv6 addresses
- Update phoenix_html from 3.0.2 to 3.0.4

## Considerations of Success
- Check with Fly Devs
- Check with users on community.fly.io, Twitter, etc
- Look at how much time this page is used as compared to flyctl apps list and flyctl status - if logs are available and quantifiable

FYI, if a fly ssh console session is active when a redeploy is triggered, the session locks up, I couldn't Ctrl-C out of it