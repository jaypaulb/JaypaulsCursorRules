# WebSocket API Development Standards

WebSocket and real-time API development standards. Covers connection management, message patterns, reconnection logic, and atomic design structure for WebSocket clients and servers.

## WebSocket Overview

### Core Concepts

- **Connection**: Persistent bidirectional connection
- **Messages**: Text or binary messages
- **Events**: Connection, message, error, close events
- **Reconnection**: Automatic reconnection on disconnect
- **Heartbeat**: Keep-alive mechanism

### Connection Lifecycle

1. **Connect**: Establish WebSocket connection
2. **Authenticate**: Send authentication message (if required)
3. **Subscribe**: Subscribe to channels/topics (if applicable)
4. **Receive**: Handle incoming messages
5. **Send**: Send messages to server
6. **Reconnect**: Handle disconnections and reconnect
7. **Close**: Clean shutdown

## Code Structure (Atomic Design)

Structure WebSocket code following atomic design hierarchy (see global/code-structure.md):

### Atoms (Basic Building Blocks)

- **Message Types**: Message data structures
- **Event Handlers**: Basic event handler functions
- **Connection Utilities**: Connection state management
- **Size**: <100 lines each

### Molecules (Composed Components)

- **Connection Manager**: Manages WebSocket connection lifecycle
- **Message Handler**: Handles incoming/outgoing messages
- **Reconnection Logic**: Handles reconnection
- **Compose atoms**: Import and use message types, handlers
- **Size**: <200 lines each

### Organisms (Complex Modules)

- **WebSocket Client**: Complete WebSocket client
- **WebSocket Server**: Complete WebSocket server
- **Compose molecules**: Import connection manager, message handler
- **Size**: <500 lines

## Connection Management

### Connection Patterns

- Use connection pool for multiple connections
- Handle connection state (connecting, connected, disconnected, reconnecting)
- Implement connection timeout
- Handle connection errors gracefully

### Authentication

- Authenticate after connection established
- Send auth token in initial message or header
- Handle authentication failures
- Re-authenticate on reconnection

## Message Patterns

### Message Format

- **Text Messages**: JSON-encoded strings (most common)
- **Binary Messages**: Binary data (for performance)
- **Message Structure**: `{ type: "message_type", data: {...}, id: "message_id" }`

### Message Types

- **Subscribe**: Subscribe to channels/topics
- **Unsubscribe**: Unsubscribe from channels/topics
- **Publish**: Publish message to channel
- **RPC**: Remote Procedure Call pattern
- **Heartbeat**: Keep-alive ping/pong

## Reconnection Logic

### Automatic Reconnection

- Use exponential backoff for reconnection attempts
- Set maximum reconnection attempts
- Implement minimum/maximum backoff delays
- Re-subscribe to channels on reconnection

### State Recovery

- Queue messages during disconnection
- Replay queued messages on reconnection
- Sync state with server after reconnection
- Handle message deduplication

## Error Handling

### Connection Errors

- Handle network failures gracefully
- Implement proper error logging
- Provide error callbacks for consumers
- Handle server-sent errors

### Message Errors

- Validate message format
- Handle invalid messages
- Return error responses for failed operations
- Log errors for debugging

## Performance

- Use binary messages for large data transfers
- Implement message batching
- Use compression when available
- Monitor connection health
- Implement rate limiting for messages

## Security

- Use WSS (WebSocket Secure) for encrypted connections
- Validate all incoming messages
- Implement proper authentication
- Sanitize message data
- Implement CORS policies

## Testing (TDD)

- Mock WebSocket connections
- Test connection lifecycle
- Test message sending/receiving
- Test reconnection logic
- Test error handling
- Test authentication
