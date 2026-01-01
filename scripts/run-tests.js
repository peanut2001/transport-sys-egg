'use strict'

const fs = require('fs')
const path = require('path')
const { spawnSync } = require('child_process')

function hasTestFiles(dir) {
  if (!fs.existsSync(dir)) {
    return false
  }

  const entries = fs.readdirSync(dir, { withFileTypes: true })
  for (const entry of entries) {
    if (entry.name === 'fixtures' || entry.name === 'node_modules') {
      continue
    }

    const fullPath = path.join(dir, entry.name)
    if (entry.isDirectory()) {
      if (hasTestFiles(fullPath)) {
        return true
      }
      continue
    }

    if (entry.isFile() && entry.name.endsWith('.test.js')) {
      return true
    }
  }

  return false
}

const testRoot = path.join(process.cwd(), 'test')
if (!hasTestFiles(testRoot)) {
  console.log('No test files found, skipping test run.')
  process.exit(0)
}

const result = spawnSync('egg-bin', [ 'test' ], { stdio: 'inherit', shell: true })
if (result.error) {
  console.error(result.error)
}
process.exit(result.status !== undefined ?  result.status : 1)
