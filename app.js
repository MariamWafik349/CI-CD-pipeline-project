const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('WELLCOME TO NTI');
});

const PORT = 3000; // Ensure this is capitalized and consistent
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`); // Correct variable name
});

