import express from 'express';
import { json } from 'body-parser';

const app = express();

app.use(json());

const items = [];

app.get('/', (req, res) => {
  res.json(items);
});

app.post('/', (req, res) => {
  items.push(req.body);
  res.json(req.body);
});

app.listen(4000, () => {
  console.info('Listening on port 4000');
});
