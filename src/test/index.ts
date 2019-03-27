import { IncomingMessage, ServerResponse } from "http";

import { code, reason } from "./http";

export default (req: IncomingMessage, res: ServerResponse) => {
  res.writeHead(code, reason);
  res.end();
};
