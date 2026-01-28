## Overview
This project sets up a containerized development environment using Docker, Vite, React, and TypeScript. The application displays "Codin 1" and runs on port 7775.

## Requirements Met
- Development environment using Docker containers
- Displays `<h1>Codin 1</h1>` using Vite + React
- Container named "lastName_firstName_coding_assignment11"
- Working directory named "lastName_firstName_site"
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
npm create vite@latest lastName_firstName_site -- --template react-ts
cd lastName_firstName_site
npm install
```

Replace `lastName_firstName` with your actual name.

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
WORKDIR /lastName_firstName_site
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
docker build -t lastName_firstName_coding_assignment11 .
```

Run the container:
```bash
docker run -p 7775:7775 --name lastName_firstName_coding_assignment11 lastName_firstName_coding_assignment11
```

Access the app at http://localhost:7775

## Useful Commands

Stop container:
```bash
docker stop lastName_firstName_coding_assignment11
```

Start container:
```bash
docker start lastName_firstName_coding_assignment11
```

Remove container:
```bash
docker rm lastName_firstName_coding_assignment11
```

View logs:
```bash
docker logs lastName_firstName_coding_assignment11
```

View running containers:
```bash
docker ps
```

## Troubleshooting

**Port already in use:**
Check what's using port 7775 and stop it, or use a different port mapping.

**Container name exists:**
Remove the existing container first with `docker rm`.

**Changes not showing:**
The container uses polling for hot reload. Try a hard refresh in your browser.

**Need to rebuild:**
```bash
docker stop lastName_firstName_coding_assignment11
docker rm lastName_firstName_coding_assignment11
docker build -t lastName_firstName_coding_assignment11 .
docker run -p 7775:7775 --name lastName_firstName_coding_assignment11 lastName_firstName_coding_assignment11
```

## Notes
- Using Node v25.3.0 to match local development environment
- Vite provides hot module replacement for faster development
- Alpine Linux keeps the Docker image small

## Submission
Repository includes:
- Dockerfile
- README.md
- vite.config.ts
- Source files