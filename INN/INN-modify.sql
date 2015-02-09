-- Jeff McGovern
-- jmcgover@calpoly.edu

-- Add description attribute
ALTER TABLE rooms 
   ADD description VARCHAR(280);

-- Adds description content

UPDATE rooms 
   SET description="Do you like pillows? Really thick, long pillows? Well, that's what a bolster is! Abscond to this room that has said pillows!" 
   WHERE RoomId="AOB";
UPDATE rooms 
   SET description="Optimism is the surest form of flattery. Traditional optimists will appreciate this room which is, optimistically, affordable and has a largely optimistic King sized bed." 
   WHERE RoomId="CAS";
UPDATE rooms 
   SET description="Are you Frugal? Steer clear of this one! That's what 'apropros' means!!" 
   WHERE RoomId="FNA";
UPDATE rooms 
   SET description="Let this room be a harbinger for better times. Modern decor affords a low price, by bequest." 
   WHERE RoomId="HBB";
UPDATE rooms 
   SET description="Prefer rooms that haven't changed since the times of agrarian society? Not easily offended by room prices? This rustic decor is almost insultingly beautiful." 
   WHERE RoomId="IBD";
UPDATE rooms 
   SET description="Much like a hospital, this room offers healthful solace, but with a bigger bed, of course." 
   WHERE RoomId="IBS";
UPDATE rooms 
   SET description="Modern times offer affordable options. A night in this room will leavee you begging for more." 
   WHERE RoomId="MWC";
UPDATE rooms 
   SET description="Hole yourself up in a room that defies expectations. King sized bed is a revolutionary experience." 
   WHERE RoomId="RND";
UPDATE rooms 
   SET description="Jokers need not be implicated here. Up to 4 people can occupy this lovely room in perfect complicity." 
   WHERE RoomId="RTE";
UPDATE rooms 
   SET description="Looking for cheap? IKEA-built and modern, this room affords a wonderful, awarding experience at our best price yet!" 
   WHERE RoomId="TAA";


SELECT * FROM rooms 
   ORDER BY RoomId \G
