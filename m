Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB511D26C2
	for <lists+linux-fbdev@lfdr.de>; Thu, 10 Oct 2019 11:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733268AbfJJJx5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 10 Oct 2019 05:53:57 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59894 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfJJJx4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 10 Oct 2019 05:53:56 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9A9pV2K030904;
        Thu, 10 Oct 2019 09:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ahGSpze+9lUT7YqwkusHb/yoyTKU/yaGcaTwqlc6Jbs=;
 b=f1xpBmgeIXxHrIIYpzdeKMs6JcvHmJ7YGK1Tfxlt/VZjXwFbz0zkxMMTBrZQKBCfmyEh
 zYUYImaJf1zX5QoMajO894wr7aBHnlqmrXvSz+YeU07jKOnuH4XggfjCrWQIyYQtEHN4
 yI4imaY9eyryrMntSkHy/c4n9Ths8IaIVU74N/mVKngdOPBxX7o7qI0I0ejec2knyiak
 fKmFmMEq9DGIBiQt49sq5pvVSqyREwTtIVwJizBHCikqsvXW4RvZzHAB91X/vgXYdKV6
 SfJNl+Nwh9nAf4FiabLQ2nTUmw4Wky6rwNJqsWfNi3RDKtwOgJASBfpa8NxC32bBYSfL 2A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2vejkut3f9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Oct 2019 09:53:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9A9hQJ4129582;
        Thu, 10 Oct 2019 09:53:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2vh8k2j3w4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Oct 2019 09:53:46 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9A9rgIH023123;
        Thu, 10 Oct 2019 09:53:43 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 10 Oct 2019 02:53:42 -0700
Date:   Thu, 10 Oct 2019 12:53:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yizhuo <yzhai003@ucr.edu>
Cc:     devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
        Teddy Wang <teddy.wang@siliconmotion.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] staging: sm750fb: Potential uninitialized field in "pll"
Message-ID: <20191010091834.GG20470@kadam>
References: <20191010043809.27594-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010043809.27594-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=866
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910100087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=953 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910100088
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Oct 09, 2019 at 09:38:08PM -0700, Yizhuo wrote:
> Inside function set_chip_clock(), struct pll is supposed to be
> initialized in sm750_calc_pll_value(), if condition
> "diff < mini_diff" in sm750_calc_pll_value() cannot be fulfilled,
> then some field of pll will not be initialized but used in
> function sm750_format_pll_reg(), which is potentially unsafe.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>

The patch is correct, but it doesn't apply to linux-next any more.  Can
you re-write it on top of the most recent staging-next and resend?

regards,
dan carpenter

