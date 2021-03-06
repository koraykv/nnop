local Parameters, parent = torch.class('nnop.Parameters', 'nn.Module')

function Parameters:__init(...)
   parent.__init(self)
   self.weight = torch.Tensor(...)
   self.gradWeight = torch.Tensor(...)
end

function Parameters:normal(...)
   self.weight:normal(...)
end

function Parameters:uniform(...)
   self.weight:uniform(...)
end

function Parameters:updateOutput()
   self.output = self.weight
   return self.output
end

function Parameters:accGradParameters(_, gradOutput, scale)
   scale = scale or 1
   self.gradWeight:add(scale, gradOutput)
end
