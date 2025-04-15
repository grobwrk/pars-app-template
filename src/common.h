/*
Copyright (c) 2025 Giuseppe Roberti.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
#pragma once

constexpr auto enable_compute_fib_async = true;

#include <pars/pars.h>

#include <string>

using namespace pars;
using namespace pars::ev;

namespace pars_example::resource
{

enum class client_state
{
  creating,
  initializing,
  started,
  sending_work,
  waiting_work_done,
  terminating,
  terminated,
};

} // namespace pars_example::resource

template<>
struct fmt::formatter<::pars_example::resource::client_state>
  : fmt::formatter<std::string>
{
  auto format(const ::pars_example::resource::client_state& s,
              format_context& ctx) const -> decltype(ctx.out())
  {
    using client_state = pars_example::resource::client_state;

    switch (s)
    {
    case client_state::creating:
      return format_to(ctx.out(), "creating");
      break;

    case client_state::initializing:
      return format_to(ctx.out(), "initializing");
      break;

    case client_state::started:
      return format_to(ctx.out(), "started");
      break;

    case client_state::sending_work:
      return format_to(ctx.out(), "sending work");
      break;

    case client_state::waiting_work_done:
      return format_to(ctx.out(), "waiting work done");
      break;

    case client_state::terminating:
      return format_to(ctx.out(), "terminating");
      break;

    case client_state::terminated:
      return format_to(ctx.out(), "terminated");
      break;

    default:
      return format_to(ctx.out(), "<client_state-{}>", static_cast<int>(s));
      break;
    }
  }
};
