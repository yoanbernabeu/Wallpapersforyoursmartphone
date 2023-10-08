// 1. Import utilities from `astro:content`
import { z, defineCollection } from 'astro:content';

// 2. Define a `type` and `schema` for each collection
const wallpapersCollection = defineCollection({
  schema: ({ image }) => z.object({
    image: image().refine((img) => img.width >= 500, {
      message: "Cover image must be at least 1080 pixels wide!",
    }),
  }),
});

// 3. Export a single `collections` object to register your collection(s)
export const collections = {
  'wallpapers': wallpapersCollection,
};