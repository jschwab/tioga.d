def make_range(xr,yr)
  return xr + yr.reverse
end

def drange(min, max, npts)
  return Dvector.new(npts) {|i| min + i/(npts-1e0) * (max - min)}
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
