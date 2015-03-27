def make_range(xr, yr)
  xr + yr.reverse
end

def drange(min, max, npts)
  Dvector.new(npts) { |i| min + i / (npts - 1e0) * (max - min) }
end

def simple_colormap(rgb1, rgb2)
  hls1 = t.rgb_to_hls(rgb1)
  hls2 = t.rgb_to_hls(rgb2)
  t.create_gradient_colormap(
    'starting_H' => hls1[0], 'starting_L' => hls1[1], 'starting_S' => hls1[2],
    'ending_H' => hls2[0], 'ending_L' => hls2[1], 'ending_S' => hls2[2])
end

def plot_boundaries(xs,ys,margin=0.1,ymin=nil,ymax=nil,
                    reverse_xaxis=false,reverse_yaxis=false)
  xmin = xs.min
  xmax = xs.max
  ymin = ys.min if ymin == nil
  ymax = ys.max if ymax == nil
  width = (xmax == xmin)? 1 : xmax - xmin
  height = (ymax == ymin)? 1 : ymax - ymin
  left_boundary = xmin - margin * width
  right_boundary = xmax + margin * width
  top_boundary = ymax + margin * height
  bottom_boundary = ymin - margin * height
  if reverse_xaxis
    tmp = left_boundary; left_boundary = right_boundary; right_boundary = tmp
  end
  if reverse_yaxis
    tmp = top_boundary; top_boundary = bottom_boundary; bottom_boundary = tmp
  end
  return [ left_boundary, right_boundary, top_boundary, bottom_boundary ]
end

def colored_tex(tex, color)
  '\textcolor[rgb]{%s,%s,%s}' % color + '{%s}' % [tex]
end

