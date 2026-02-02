## Overview
This project sets up a containerized development environment using Docker, Vite, React, and TypeScript. The application displays "Codin 1" and runs on port 7775.

## Requirements Met
- Development environment using Docker containers
- Displays `<h1>Codin 1</h1>` using Vite + React
- Container named "singh_jasanpreet_coding_assignment1"
- Working directory named "singh_jasanpreet_site"
- Runs on localhost:7775

## Tech Stack
- Docker
- Node.js v25.3.0
- Vite
- React
- TypeScript

## Prerequisites
- Docker Desktop installed and running
- Git

## Setup

### Create the Vite Project
```bash
npm create vite@latest singh_jasanpreet_site
cd singh_jasanpreet_site
npm install
```

### Configure Vite
Update `vite.config.ts`:

```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0',
    port: 7775,
    strictPort: true,
    watch: {
      usePolling: true,
    },
  },
})
```

### Update App Component
Edit `src/App.tsx`:

```typescript
import './App.css'

function App() {
  return (
    <div className="App">
      <h1>Codin 1</h1>
    </div>
  )
}

export default App
```

### Add Docker Files
Create `Dockerfile`:

```dockerfile
FROM node:25-alpine
WORKDIR /singh_jasanpreet_site
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 7775
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "7775"]
```

Create `.dockerignore`:

```
node_modules
dist
.git
.DS_Store
```

## Running the Container

Build the image:
```bash
docker build -t singh_jasanpreet_coding_assignment11 .
```

Run the container:
```bash
docker run --name singh_jasanpreet_coding_assignment11 -p 7775:7775 singh_jasanpreet_coding_assignment11
```

Access the app at http://localhost:7775

## Useful Commands

Stop container:
```bash
docker stop singh_jasanpreet_coding_assignment11
```

Start container:
```bash
docker start singh_jasanpreet_coding_assignment11
```

Remove container:
```bash
docker rm singh_jasanpreet_coding_assignment11
```

View logs:
```bash
docker logs singh_jasanpreet_coding_assignment11
```

View running containers:
```bash`  
docker ps

```
