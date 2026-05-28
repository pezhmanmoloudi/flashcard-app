interface PlaceholderColor {
  bg: string
  text: string
}

const PALETTE: PlaceholderColor[] = [
  { bg: '#fde8e8', text: '#e57373' },
  { bg: '#fef3c7', text: '#d97706' },
  { bg: '#d1fae5', text: '#059669' },
  { bg: '#dbeafe', text: '#3b82f6' },
  { bg: '#ede9fe', text: '#7c3aed' },
  { bg: '#fce7f3', text: '#db2777' },
  { bg: '#e0f2fe', text: '#0284c7' },
  { bg: '#fdf4ff', text: '#a855f7' },
]

export function getPlaceholderColor(id: number): PlaceholderColor {
  return PALETTE[id % PALETTE.length]
}
